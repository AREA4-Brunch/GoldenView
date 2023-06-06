# Aleksandar Radenkovic 2020/0272
import logging

from typing import Union

from django.utils import timezone
from django.db import transaction
from django.db.models import BigIntegerField
from decimal import Decimal

from apps.user_management.models import Trader, Broker, FundsTransferMethod

from apps.asset_management.models import Asset, ActiveTradeRequest, \
                                         PurchaseRequest, SalesRequest, \
                                         MakeBeliefOwns, AssetTransaction, \
                                         CarriedOutTradeRequest

from apps.broker_management.models import BrokerBasicUserContract, \
                                          IsBindedByContract

from background_task import background
from background_task.models import Task



class InsufficentFunds(Exception):
    pass


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


# TODO: uncomment to use tasks queue
# @background(schedule=0, queue='match_requests')
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
                idsalesrequest__quantityrequested__gt=0,
                unitpricelowerbound__lte=request.unitpriceupperbound,
                unitpriceupperbound__gte=request.unitpricelowerbound
            ).order_by(
                'idsalesrequest'
            )
        else:  # is sales request
            matching_requests = PurchaseRequest.objects.filter(
                idpurchaserequest__idasset=request.idsalesrequest.idasset,
                idpurchaserequest__quantityrequested__gt=0,
                unitpricelowerbound__lte=request.unitpriceupperbound,
                unitpriceupperbound__gte=request.unitpricelowerbound
            ).order_by(
                'idpurchaserequest'
            )

        if not matching_requests:
            logging.info(f'No matching requests for {request_id}')
            return

        # match with each request if possible
        for matching_request in matching_requests:
            try:
                were_reqs_fulfilled = process_matching_requests(
                    purchase_request=request if is_purchase_request else matching_request,
                    sales_request=matching_request if is_purchase_request else request
                )

                logging.info('Gracefully exited a match.')

                # stop if given request was fulfilled
                if were_reqs_fulfilled[0 if is_purchase_request else 1]:
                    logging.info('Done matching')
                    break

            except Exception as e:
                logging.exception(f'Single matching with request for {request_id} failed.')

    except Exception as e:
        # in case of failure enqueue task that matches all not just 1
        # active request
        logging.exception(f'Match traders requets failed for is_purchase_request={is_purchase_request}'
                        + f', request_id={request_id}')
        process_all_active_requests.now()


# TODO: uncomment to use tasks queue
# @background(schedule=2, queue='match_requests')
def process_all_active_requests():
    """
        Failsafe to be called in case any match_traders_request
        fails, making sure all previous active_trade_requests
        get the chance to be matched with requests that came
        before them.
    """

    try:
        logging.warning('Starting the process_all_active_requests.')

        # choose table with fewer records and go through each unfulfilled reqeust
        # and match them (if indexes over db then could iterate in O(m + n))
        if PurchaseRequest.objects.count() < SalesRequest.objects.count():
            requests = PurchaseRequest.objects.filter(
                idpurchaserequest__quantityrequired__gt=0
            )
            # could order by lower bound unit price and create custom iteration
            for trade_request in requests:
                match_traders_request(True, trade_request.idpurchaserequest.idtraderequest)
        else:
            requests = SalesRequest.objects.filter(
                idsalesrequest__quantityrequired__gt=0
            )
            # could order by lower bound unit price and create custom iteration
            for trade_request in requests:
                match_traders_request(False, trade_request.idsalesrequest.idtraderequest)

        # clean up the fulfilled purchase trade requests
        with transaction.atomic():
            requests = PurchaseRequest.objects.select_for_update().filter(
                idpurchaserequest__quantityrequired=0
            )

            for trade_request in requests:
                process_fulfilled_trade_request(trade_request_spec=trade_request)

        # clean up the fulfilled sales trade requests
        with transaction.atomic():
            requests = SalesRequest.objects.select_for_update().filter(
                idsalesrequest__quantityrequired=0
            )

            for trade_request in requests:
                process_fulfilled_trade_request(trade_request_spec=trade_request)

        logging.warning('Successfuly ended the process_all_active_requests.')

    except Exception as e:
        logging.exception('process_all_active_requests failed. Launching another one..')
        # process_all_active_requests.now()


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

    process_all_active_requests()

    for task in incomplete_tasks:
        task.delete()

    return True


@transaction.atomic
def process_matching_requests(
    purchase_request: PurchaseRequest,
    sales_request: SalesRequest
):
    """ Returns tuple of bools
        (was_purchase_req_fulfilled, was_sales_request_fulfilled).
    """
    were_requests_fulfilled = [False, False]

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
                    + f' for purchase_request={purchase_request_base.idtraderequest}'
                    + f', sales_request={sales_request_base.idtraderequest}')
        return were_requests_fulfilled

    logging.info('Successful match - transaction part.')

    # check if any of the requests is fulfilled
    # and handle the contract fee if it is
    # and finally remove active trade request from the db
    try:
        were_requests_fulfilled[0] = process_fulfilled_trade_request(
            trade_request_spec=purchase_request,
            trade_request=purchase_request_base
        )

    except Exception as e:
        logging.exception('Failed to check and try to fulfill purchase_request')
        # run the task that processes all unprocessed fulfilled requests
        process_all_active_requests()

    try:
        were_requests_fulfilled[1] = process_fulfilled_trade_request(
            trade_request_spec=sales_request,
            trade_request=sales_request_base
        )

    except Exception as e:
        logging.exception('Failed to check and try to fulfill sales_request')
        # run the task that processes all unprocessed fulfilled requests
        process_all_active_requests()

    logging.info('Successful entire match.')
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
        Assuming the given requests match based on idasset and lower and
        upper unit price bounds.
    """
    if purchase_request is None:
        purchase_request = ActiveTradeRequest.objects.select_for_update().get(
            idtraderequest=purchase_request_spec.idpurchaserequest.idtraderequest
        )

    if sales_request is None:
        sales_request = ActiveTradeRequest.objects.select_for_update().get(
            idtraderequest=sales_request_spec.idsalesrequest.idtraderequest
        )

    # do not let the user buy from themself
    if purchase_request.iduser == sales_request.iduser:
        return False

    quantity = min(purchase_request.quantityrequired,
                   sales_request.quantityrequired)

    if quantity <= 0:
        return False

    # smallest unit price they both agree on
    unit_price = max(purchase_request_spec.unitpricelowerbound,
                     sales_request_spec.unitpricelowerbound)

    logging.info( f'Starting transaction between matched requests, quantity={quantity}'
                + f' unit_price={unit_price}')

    transaction_price = exchange_money_for_asset(
        buyer=purchase_request.iduser,
        seller=sales_request.iduser,
        unit_price=unit_price,
        quantity=quantity,
        asset=purchase_request.idasset
    )

    # store the transactions as records for both purchase
    # and sales requests:
    create_trade_request_transaction(
        quantity=quantity,
        unit_price=unit_price,
        id_purchase_request=purchase_request.idtraderequest
    )

    create_trade_request_transaction(
        quantity=quantity,
        unit_price=unit_price,
        id_sales_request=sales_request.idtraderequest
    )

    # update the active requests:
    purchase_request.totaltransactionsprice += transaction_price
    sales_request.totaltransactionsprice += transaction_price

    purchase_request.quantityrequired -= quantity
    sales_request.quantityrequired -= quantity

    purchase_request.save()
    sales_request.save()
    # no changes were made on the specialization object nothing to save

    return True


@transaction.atomic
def process_fulfilled_trade_request(
    trade_request_spec: Union[PurchaseRequest, SalesRequest],
    trade_request: ActiveTradeRequest=None
) -> bool:
    """
        Assuming the given `request_spec` was acquired by select_for_update and is
        specialization of ActiveTradeRequest.
        Checks if `quantityrequired` == 0 and if true handles it, therefore
        quantity acquired will equal the `quantityrequested`.
        Returns whether request was fulfilled and handled.
    """
    if trade_request is None:
        if isinstance(trade_request_spec, (PurchaseRequest)):
            trade_request = ActiveTradeRequest.objects.select_for_update().get(
                idtraderequest=trade_request_spec.idpurchaserequest.idtraderequest
            )
        elif isinstance(trade_request_spec, (SalesRequest)):
            trade_request = ActiveTradeRequest.objects.select_for_update().get(
                idtraderequest=trade_request_spec.idsalesrequest.idtraderequest
            )
        else:
            raise Exception('Passed type of `trade_request_spec` is not supported.')

    if trade_request.quantityrequired > 0:
        return False

    # move the trade request from active in trading_platform
    # db into trading_history db
    carried_out_trade_request = CarriedOutTradeRequest(
        id_trade_request=trade_request.idtraderequest,
        is_purchase=isinstance(trade_request_spec, (PurchaseRequest)),
        id_user=trade_request.iduser_id,
        id_asset=trade_request.idasset_id,
        quantity=trade_request.quantityrequested,
        total_price=trade_request.totaltransactionsprice
    )

    # handle the contract fee if any and remove the contract from
    # active trade requests - contracts relationship into trading_history
    # along with the rest of the request's data
    contract_relationship = IsBindedByContract.objects.select_for_update().filter(
        idtraderequest=trade_request.idtraderequest
    )

    if contract_relationship.exists():  # pay the broker fee
        contract_relationship = contract_relationship.first()

        contract = BrokerBasicUserContract.objects.select_for_update().get(
            idcontract=contract_relationship.idcontract_id
        )

        (status, fee_paid) = pay_broker_fee(
            trade_request=trade_request,
            contract=contract
        )

        # store the contract data
        carried_out_trade_request.contract = CarriedOutTradeRequest.Contract(
            id=contract.idcontract,
            time=timezone.now(),
            status=status
        )

        if status == 'OK':
            carried_out_trade_request.contract.fee_paid = fee_paid

        contract_relationship.delete()

    # save the fulfilled trade request data
    carried_out_trade_request.save()

    # remove from the active trade requests, and the specialized table
    trade_request_spec.delete()
    trade_request.delete()

    return True


@transaction.atomic
def exchange_money_for_asset(
    buyer: Trader,
    seller: Trader,
    unit_price: float,
    quantity: int,
    asset: Asset
):
    """
        Assumes `quantity` > 0 and `unit_price` > 0.
        Returns the total transaction price.
        Does not store the transaction.
    """

    total_price = quantity * unit_price

    # lock buyer, seller and their funds and owned assets:

    buyer = Trader.objects.select_for_update().get(
        idtrader=buyer.idtrader
    )

    seller = Trader.objects.select_for_update().get(
        idtrader=seller.idtrader
    )

    seller_funds = FundsTransferMethod.objects.select_for_update().get(
        idpaymentmethod=seller.idselectedfundstrasnfermethod_id
    )

    seller_asset_funds = MakeBeliefOwns.objects.select_for_update().get(
        idpaymentmethod=seller.idselectedfundstrasnfermethod_id,
        idasset=asset
    )

    # check if seller has enough asset:
    if seller_asset_funds.quantity < quantity:
        logging.error(f'Insufficient asset quantity by {seller.idtrader.iduser}')
        raise Exception('Insufficient asset quantity')

    buyer_funds = FundsTransferMethod.objects.select_for_update().get(
        idpaymentmethod=buyer.idselectedfundstrasnfermethod_id
    )

    # check if buyer has enough money:
    if buyer_funds.makebeliefbalance < total_price:
        logging.error(f'Insufficient funds by {buyer.idtrader.iduser}')
        raise Exception('Insufficient funds')

    try:
        buyer_asset_funds = MakeBeliefOwns.objects.select_for_update().get(
            idpaymentmethod=buyer.idselectedfundstrasnfermethod_id,
            idasset=asset
        )

    except MakeBeliefOwns.DoesNotExist as e:
        # user does not yet own this asset so create the relationship
        buyer_asset_funds = MakeBeliefOwns.objects.create(
            idpaymentmethod=buyer.idselectedfundstrasnfermethod,
            idasset=asset,
            quantity=0.
        )

    # transfer money from buyer to seller:
    seller_funds.makebeliefbalance += total_price
    buyer_funds.makebeliefbalance -= total_price

    # transfer the asset from seller to buyer:
    seller_asset_funds.quantity -= quantity
    buyer_asset_funds.quantity += quantity

    buyer_funds.save()
    seller_funds.save()
    buyer_asset_funds.save()
    seller_asset_funds.save()

    return total_price


def create_trade_request_transaction(
    quantity: int,
    unit_price: int,
    id_purchase_request: BigIntegerField=None,
    id_sales_request: BigIntegerField=None
):
    if not ((id_purchase_request is not None) ^ (id_sales_request is not None)):
        raise Exception('Must pass either purchase or sales request id.')

    transaction = AssetTransaction(
        quantity=quantity,
        unit_price=unit_price,
        time=timezone.now()
    )

    if id_purchase_request is not None:
        transaction.id_trade_request_purchase = id_purchase_request
    else:
        transaction.id_trade_request_sale = id_sales_request

    transaction.save()


@transaction.atomic
def pay_broker_fee(
    trade_request: ActiveTradeRequest,
    contract: BrokerBasicUserContract
):
    status = 'OK'
    fee_paid = float(contract.feepercentage) \
             * float(trade_request.totaltransactionsprice) \
             / 100.

    try:
        money_transaction(
            src=trade_request.iduser,
            dst=contract.idbroker,
            amount=fee_paid
        )

    except InsufficentFunds as e:
        # basic user did not have the money to pay out the broker
        status = 'FBU'

    return (status, fee_paid)


@transaction.atomic
def money_transaction(
    src: Trader,
    dst: Union[Trader, Broker],
    amount: float
):
    # lock src, dst and their funds:
    amount = Decimal(amount)

    src = Trader.objects.select_for_update().get(
        idtrader=src.idtrader_id
    )

    if isinstance(dst, (Trader)):
        dst = Trader.objects.select_for_update().get(
            idtrader=dst.idtrader_id
        )
    else:  # typeof Broker
        dst = Trader.objects.select_for_update().get(
            idtrader=dst.idbroker_id
        )

    src_funds = FundsTransferMethod.objects.select_for_update().get(
        idpaymentmethod=src.idselectedfundstrasnfermethod_id
    )

    dst_funds = FundsTransferMethod.objects.select_for_update().get(
        idpaymentmethod=dst.idselectedfundstrasnfermethod_id
    )

    # check if src has enough money:
    if src_funds.makebeliefbalance < amount:
        logging.error(f'Insufficient funds by {src.idtrader.iduser}')
        raise InsufficentFunds('Insufficient funds for broker fee.')

    # transfer money from src to dst:
    dst_funds.makebeliefbalance += amount
    src_funds.makebeliefbalance -= amount

    src_funds.save()
    dst_funds.save()
