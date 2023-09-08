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



class InvalidForm(Exception):
    pass



"""
    Process the form for fetching the request of user by contract.
"""
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
    idcontract: int,  # None if it was not binded by contract
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
