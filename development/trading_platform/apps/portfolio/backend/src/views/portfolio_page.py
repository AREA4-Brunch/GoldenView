"""
    Aleksandar Radenkovic 2020/0272
"""


import logging

from typing import Union

from django.http import HttpRequest
from django.utils import timezone

from apps.broker_management.models import BrokerBasicUserContract
from apps.asset_management.models import PurchaseRequest, \
                                         SalesRequest, \
                                         CarriedOutPurchaseTradeRequest, \
                                         CarriedOutSalesTradeRequest, \
                                         Asset
from apps.asset_management.backend.src.utils import portfolio
from apps.user_management.models import Trader



class InvalidForm(Exception):
    pass


class AccessDenied(Exception):
    def __init__(self) -> None:
        super().__init__(f'Unauthorized to view given trade request')



def get_cleaned_data(
    request: HttpRequest,
    context: dict[str]
):
    request_data = {
        'filters': {}
    }

    def parse_data():
        is_valid = True

        try:  # process contract
            request_data["filters"]["contract"] = request.POST.get("contract", None)
        except Exception as e:
            is_valid = False
            context['internal_err'] = 'Invalid contract form data.'

        if not is_valid:
            raise InvalidForm('Form is not valid')

    def validate_data():
        is_valid = True

        # valite if the contract exists in the database
        # and the user who sent is the accepted broker in the contract
        if request_data["filters"]['contract'] is not None:
            request_data["filters"]['contract'] = int(request_data["filters"]['contract'])
            try:
                contract = BrokerBasicUserContract.objects.get(
                    idcontract=request_data["filters"]['contract'],
                    idbroker=request.user.pk,
                    wasaccepted=1,
                    # expirationtime__gt=timezone.now()
                )
                request_data["filters"]["contract"] = contract

            except Exception as e:
                is_valid = False
                context['internal_err'] = 'Failed to find the contract requested.'
                logging.error('Failed to find the contract requested.')

        if not is_valid:
            raise InvalidForm('Form is not valid')


    parse_data()
    validate_data()

    return request_data


def fetch_all_users_trade_requests(
    request_data: dict,
    context: dict
):
    """
        Fetches data for all trade request made by user.
    """
    ( active_purchase_trade_requests,
      active_sales_trade_requests,
      carried_out_purchase_requests,
      carried_out_sales_requests,
    ) = portfolio.fetch_users_trade_requests(
            trader=request_data['trader'],
            filters=request_data['filters'],
            sorted=True,
        )

    trade_requests = [convert_active_trade_req_to_displayable_data(req[0], req[1]) for req in active_purchase_trade_requests] \
                   + [convert_active_trade_req_to_displayable_data(req[0], req[1]) for req in active_sales_trade_requests] \
                   + [convert_carried_out_trade_req_to_displayable_data(req) for req in carried_out_purchase_requests] \
                   + [convert_carried_out_trade_req_to_displayable_data(req) for req in carried_out_sales_requests]

    # sort by desc id - time created desc => LIFO
    # logging.info(trade_requests)
    # trade_requests = sorted(trade_requests, key=lambda x: x['id'], reverse=True)

    context['transactions'] = trade_requests


def convert_active_trade_req_to_displayable_data(
    request: Union[PurchaseRequest, SalesRequest],
    idcontract: int,  # None if it was not bound by contract
):
    """
        Converts table data into django html template used data.
    """
    is_purchase_request = isinstance(request, PurchaseRequest)

    data = {
        'is_active': True,
        'id': request.pk,
        'min': request.unitpricelowerbound,
        'max': request.unitpriceupperbound,
    }

    try:
        asset = Asset.objects.get(idasset=request.idasset_id)
        data['ticker'] = asset.tickersymbol
    except Exception as e:
        logging.error('Active trade request without existing idasset;'
                     + f'idasset={request.idasset_id}')
        data['ticker'] = f'ID: {request.idasset_id}'

    quantity_acquired = request.quantityrequested - request.quantityrequired
    data['quantity_acquired'] = quantity_acquired
    data['quantity_requested'] = request.quantityrequested
    data['value'] = request.totaltransactionsprice
    data['type'] = 'BUY' if is_purchase_request else 'SELL'
    if idcontract is not None:
        data['idcontract'] = idcontract

    return data


def convert_carried_out_trade_req_to_displayable_data(
    request: Union[CarriedOutPurchaseTradeRequest,
                   CarriedOutSalesTradeRequest]
):
    """
        Converts table data into django html template used data.
    """
    data = {
        'is_active': False,
        'id': request.id_trade_request
    }

    try:
        asset = Asset.objects.get(idasset=request.id_asset)
        data['ticker'] = asset.tickersymbol
    except Exception as e:
        logging.error('Active trade request without existing idasset;'
                     + f'idasset={request.idasset_id}')
        data['ticker'] = f'ID: {request.idasset_id}'

    data['quantity_acquired'] = request.quantity
    data['value'] = request.total_price
    data['type'] = 'BUY' \
                 if isinstance(request, CarriedOutPurchaseTradeRequest) \
                 else 'SELL'
    if request.contract is not None:
        data['idcontract'] = request.contract.id

    return data


def get_trade_request_details(
    trader: Trader,
    idtraderequest: int,
    is_purchase_request: bool
) -> tuple[
    Union[
        PurchaseRequest,
        SalesRequest,
        CarriedOutPurchaseTradeRequest,
        CarriedOutSalesTradeRequest
    ],
    BrokerBasicUserContract
]:
    """
        Checks if given trader has access to view the
        active or carreid out trade reqeust with given id
        and if true then returns the trade request else returns None.
    """

    def format_transactions(transactions):
        transactions = [
            {
                'quantity': transaction.quantity,
                'unit_price': transaction.unit_price,
                'time': transaction.time,
            }
            for transaction in transactions
        ]
        return transactions

    def fetch_carried_out_trade_request_details(trade_request):
        """ If trader has view access to given trade_request
            returns trade_request, and contract (id exists) or None,
            else returns None, None.
        """
        contract = trade_request.contract
        if contract is not None:
            contract = BrokerBasicUserContract.objects.filter(
                idcontract=contract.id,
            ).first()

        if trade_request.id_user != trader.pk \
        and (contract is None or contract.idbroker.pk != trader.pk):
            raise AccessDenied()

        trade_request_details = {
            'quantity_requested': trade_request.quantity,
            'quantity_required': 0,
            'total_transactions_val': trade_request.total_price,
        }

        transactions = portfolio.fetch_trade_request_transactions(
            idtraderequest, is_purchase_request
        )
        transactions = format_transactions(transactions)

        if contract is None:
            return trade_request_details, transactions, None

        contract_details = {
            'id': trade_request.contract.id,
            'fee_percentage': contract.feepercentage,
            'time_fee_paid': trade_request.contract.time,
            'status': trade_request.contract.status,
            'fee_paid': trade_request.contract.fee_paid,
        }

        return trade_request_details, transactions, contract_details

    def fetch_active_trade_request_details(trade_request):
        """ If trader has view access to given trade_request
            returns trade_request, and contract (id exists) or None,
            else returns None, None.
        """
        contract = trade_request.idcontract
        if contract is not None:
            contract = BrokerBasicUserContract.objects.filter(
                idcontract=contract.idcontract,
            ).first()

        if trade_request.iduser != trader \
        and (contract is None or contract.idbroker.pk != trader.pk):
            raise AccessDenied()

        trade_request_details = {
            'quantity_requested': trade_request.quantityrequested,
            'quantity_required': trade_request.quantityrequired,
            'total_transactions_val': trade_request.totaltransactionsprice,
        }

        transactions = portfolio.fetch_trade_request_transactions(
            idtraderequest, is_purchase_request
        )
        transactions = format_transactions(transactions)

        if contract is None:
            return trade_request_details, transactions, None

        contract_details = {
            'id': contract.pk,
            'fee_percentage': contract.feepercentage,
        }

        return trade_request_details, transactions, contract_details

    # filter nosql first as its more likely to be searched
    if is_purchase_request:
        trade_request = CarriedOutPurchaseTradeRequest.objects.filter(
            id_trade_request=idtraderequest
        ).first()

        if trade_request is not None:
            return fetch_carried_out_trade_request_details(trade_request)

        trade_request = PurchaseRequest.objects.filter(
            idpurchaserequest=idtraderequest
        ).first()

        if trade_request is not None:
            return fetch_active_trade_request_details(trade_request)

    else:  # is sales request
        trade_request = CarriedOutSalesTradeRequest.objects.filter(
            id_trade_request=idtraderequest
        ).first()

        if trade_request is not None:
            return fetch_carried_out_trade_request_details(trade_request)

        trade_request = SalesRequest.objects.filter(
            idsalesrequest=idtraderequest
        ).first()

        if trade_request is not None:
            return fetch_active_trade_request_details(trade_request)
