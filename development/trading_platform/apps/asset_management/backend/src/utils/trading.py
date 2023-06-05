import logging

from django.db import transaction
from django.db.models import BigIntegerField

from apps.user_management.models import Trader
from apps.asset_management.models import Asset, ActiveTradeRequest, \
                                         PurchaseRequest, SalesRequest
from apps.broker_management.models import BrokerBasicUserContract, \
                                          IsBindedByContract

from background_task import background
from background_task.models import Task


def create_buy_sell_request(
    is_purchase_request: bool,
    trader: Trader,
    asset: Asset,
    quantity: int,
    price_lower_bound: int,
    price_upper_bound: int,
    contract: BrokerBasicUserContract=None
):
    """
    Sends request for purchasing an asset.

    Args:
        is_purchase_request (bool): Whether the request for purhase or sale.
        trader (Trader): Trader whose bank account will be used.
        asset (Asset): Asset being purchased.
        quantity (int): Assumes > 0.
        price_lower_bound (int): Min unit price that is found acceptable for
                                 purchase of given asset.
        price_upper_bound (int): Max unit price that is foundacceptable for
                                 purchase of given asset.
                                 Assumes price_upper_bound
                                      >= price_lower_bound
        contract (BrokerBasicUserContract) [Optional]: Contract under which
                                                       this request is being
                                                       made by a broker for
                                                       given user (trader).
    """

    # create the request in the database
    with transaction.atomic():
        request = ActiveTradeRequest.objects.create(
            idasset=asset,
            iduser=trader,
            quantityrequested=quantity,
            # totaltransactionsprice=0.,  # default
            quantityrequired=quantity
        )

        if is_purchase_request:
            PurchaseRequest.objects.create(
                idpurchaserequest=request,
                unitpricelowerbound=price_lower_bound,
                unitpriceupperbound=price_upper_bound
            )
        else:
            SalesRequest.objects.create(
                idsalesrequest=request,
                unitpricelowerbound=price_lower_bound,
                unitpriceupperbound=price_upper_bound
            )

        # store if binded by contract, (only for active requests)
        if contract is not None:
            IsBindedByContract.objects.create(
                idtraderequest=request,
                idcontract=contract
            )

        return request


@background(schedule=0, queue='match_requests')
def match_traders_request(
    is_purchase_request: bool,
    request_id: BigIntegerField
):
    try:
        # if there are incomplete tasks process let
        # all active requests instead be processed
        if process_incomplete_tasks():
            return

        # check if the request is still active (was not already matched)
        # and removed from the db
        request = None
        try:
            if is_purchase_request:
                request = PurchaseRequest.objects.get(
                    idpurchaserequest=request_id
                )
                # opposite_table = SalesRequest
            else:
                request = SalesRequest.objects.get(
                    idsalesrequest=request_id
                )
                # opposite_table = PurchaseRequest

        except Exception as e:
            logging.exception(f'Failed to fetch the request with id: {request_id}')

        finally:
            if request is None:  # request is no longer active
                return;

        # find the requests that matched it in the opposite table
        # and sort by id so it would be fair FIFO matching
        if is_purchase_request:
            matching_requests = SalesRequest.objects.filter(
                idsalesrequest__idasset=request.idpurchaserequest.idasset,
                unitpricelowerbound__lte=request.unitpriceupperbound,
                unitpriceupperbound__gte=request.unitpricelowerbound
            ).order_by(
                'idsalesrequest'
            )
        else:  # is sales request
            matching_requests = PurchaseRequest.objects.filter(
                idpurchaserequest__idasset=request.idsalesrequest.idasset,
                unitpricelowerbound__lte=request.unitpriceupperbound,
                unitpriceupperbound__gte=request.unitpricelowerbound
            ).order_by(
                'idpurchaserequest'
            )

        if not matching_requests:
            return

        # match with each request if possible
        for matching_request in matching_requests:
            try:
                were_reqs_fulfilled = process_matching_requests(
                    purchase_request=request if is_purchase_request else matching_request,
                    sales_request=matching_request if is_purchase_request else request
                )

                # stop if given request was fulfilled
                if were_reqs_fulfilled[0 if is_purchase_request else 1]:
                    break

            except Exception as e:
                logging.exception(f'Single mathching with request for {request_id} failed.')

    except Exception as e:
        # in case of failure enqueue task that matches all not just 1
        # active request
        logging.exception(f'Match traders requets failed for is_purchase_request={is_purchase_request}'
                        + f', request_id={request_id}')
        match_all_active_requests.now()


@background(schedule=0, queue='match_requests')
def match_all_active_requests():
    """
        Failsafe to be called in case any match_traders_request
        fails, making sure all previous active_trade_requests
        get the chance to be matched with requests that came
        before them.
    """

    try:
        # TODO: choose table with fewer records and go through each user
        #       and match them (if indexes used then use lower_bound(cur_iter, table.end))
        pass

    except Exception as e:
        logging.exception('match_all_active_requests failed. Launching another one..')
        match_all_active_requests.now()


def enqueue_func(func):
    def enqueue_task(task_func, *args, **kwargs):
        task = Task(task_name=task_func.__name__)
        task.params = (args, kwargs)
        task.queue = 'match_requests'
        task.save()

    # def is_task_in_queue(task_name):
    #     return Task.objects.filter(task_name=task_name).exists()

    # # keep only 1 instance of func in the queue
    # if not is_task_in_queue(func.__name__):
    #     enqueue_task(func)

    enqueue_task(func)


def process_incomplete_tasks():
    """
        In case some task failed to catch and process the exception
        and was just skipped and marked as incomplete, then
        triger failsafe `match_all_active_requests` and remove the
        tasks.

        Returns whether there were any incomplete tasks.
    """

    # incomplete_tasks = Task.objects.filter \
    #         (failed__isnull=False, locked_at__isnull=True)
    incomplete_tasks = Task.objects.filter(
        queue='match_requests',
        failed_at__isnull=False
    )

    if not incomplete_tasks: return False;

    match_all_active_requests()

    for task in incomplete_tasks:
        task.delete()

    return True


@transaction.atomic
def process_matching_requests(
    purchase_request: PurchaseRequest,
    sales_request: SalesRequest
):
    """ Returns whether tuple of bools
        (was_purchase_req_fulfilled, was_sales_request_fulfilled).
    """
    were_requests_fulfilled = (False, False)

    purchase_request = PurchaseRequest.objects.select_for_update().get(
        idpurchaserequest=purchase_request.idpurchaserequest
    )

    sales_request = SalesRequest.objects.select_for_update().get(
        idsalesrequest=sales_request.idsalesrequest
    )

    purchase_request_base = ActiveTradeRequest.objects.select_for_update().get(
        idtraderequest=purchase_request.idpurchaserequest.idtraderequest
    )

    sales_request_base = ActiveTradeRequest.objects.select_for_update().get(
        idtraderequest=sales_request.idsalesrequest.idtraderequest
    )

    if not transact_between_matching_requests(
        purchase_request_spec=purchase_request,
        sales_request_spec=sales_request,
        purchase_request=purchase_request_base,
        sales_request=sales_request_base
    ):
        logging.info('transact_between_matching_requests returned false'
                    + f'for purchase_request={purchase_request_base.idtraderequest}'
                    + f', sales_request={sales_request_base.idtraderequest}')
        return were_requests_fulfilled

    logging.info('Successful match transaction.')

    # TODO: check if the request is fulfilled
    #       and handle the contract fee if it is
    #       then do stuff with the nosql
    try:
        were_requests_fulfilled[0] = process_fulfilled_purchase_request(
            purchase_request_spec=purchase_request,
            purchase_request=purchase_request_base
        )

    except Exception as e:
        logging.exception('Failed to check and try to fulfill purchase_request')

    try:
        were_requests_fulfilled[1] = process_fulfilled_sales_request(
            sales_request_spec=sales_request,
            sales_request=sales_request_base
        )

    except Exception as e:
        logging.exception('Failed to check and try to fulfill sales_request')

    logging.info('Successful match.')
    return were_requests_fulfilled


@transaction.atomic
def transact_between_matching_requests(
    purchase_request_spec: PurchaseRequest,
    sales_request_spec: SalesRequest,
    purchase_request: ActiveTradeRequest=None,
    sales_request: ActiveTradeRequest=None
):
    """
        Assuming the given requests were acquired by select_for_update.
    """
    if purchase_request is None:
        purchase_request = ActiveTradeRequest.objects.select_for_update().get(
            idtraderequest=purchase_request_spec.idpurchaserequest.idtraderequest
        )

    if sales_request is None:
        sales_request = ActiveTradeRequest.objects.select_for_update().get(
            idtraderequest=sales_request_spec.idsalesrequest.idtraderequest
        )

    # TODO: uncomment the following:
    # do not let the user buy from themself
    # if purchase_request.iduser == sales_request.iduser:
    #     return False

    quantity = min(purchase_request.quantityrequired,
                   sales_request.quantityrequired)

    if quantity <= 0:
        return False

    # smallest unit price they both agree on
    unit_price = max(purchase_request_spec.unitpricelowerbound,
                     sales_request_spec.unitpricelowerbound)

    # update total transaction price
    transaction_price = quantity * unit_price

    # TODO: freeze user account and reserve the money for this request match
    print('Has enough money')

    # TODO: freeze/select for update the assets from the one selling
    print('Reserved funds')

    # TODO: create nosql transaction (make it atomic)
    #       all money goes to seller, fee is transactioned in next step

    # update the active transactions:
    purchase_request.totaltransactionsprice += transaction_price
    sales_request.totaltransactionsprice += transaction_price

    purchase_request.quantityrequired -= quantity
    sales_request.quantityrequired -= quantity

    purchase_request.save()
    sales_request.save()
    # no changes were made on the specialization object nothing to save

    return True


@transaction.atomic
def process_fulfilled_purchase_request(
    purchase_request_spec: PurchaseRequest,
    purchase_request: ActiveTradeRequest=None
) -> bool:
    """
        Assuming the given request was acquired by select_for_update and is
        specialization of ActiveTradeRequest.
        Checks if quantityrequired == 0 and if true handles it.
        Returns request was fulfilled and handled.
    """
    if purchase_request is None:
        purchase_request = ActiveTradeRequest.objects.select_for_update().get(
            idtraderequest=purchase_request_spec.idpurchaserequest.idtraderequest
        )

    if purchase_request.quantityrequired > 0:
        return False

    # TODO: check if the request is fulfilled
    #       and handle the contract fee if it is
    #       then do stuff with the nosql

    return True


@transaction.atomic
def process_fulfilled_sales_request(
    sales_request_spec: SalesRequest,
    sales_request: ActiveTradeRequest=None
):
    """
        Assuming the given request was acquired by select_for_update and is
        specialization of ActiveTradeRequest.
        Checks if quantityrequired == 0 and if true handles it.
    """
    if sales_request is None:
        sales_request = ActiveTradeRequest.objects.select_for_update().get(
            idtraderequest=sales_request_spec.idsalesrequest.idtraderequest
        )

    if sales_request.quantityrequired > 0:
        return False


    # TODO: check if the request is fulfilled
    #       and handle the contract fee if it is
    #       then do stuff with the nosql

    return True
