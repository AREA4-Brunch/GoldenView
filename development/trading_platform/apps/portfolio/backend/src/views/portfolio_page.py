"""
    Aleksandar Radenkovic 2020/0272
"""


import logging

from django.http import HttpRequest
from django.utils import timezone

from apps.broker_management.models import BrokerBasicUserContract
from apps.asset_management.models import ActiveTradeRequest, \
                                         CarriedOutTradeRequest, \
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
    request_data = {}

    def parse_data():
        is_valid = True

        try:  # process contract
            request_data["contract"] = request.POST.get("contract", None)
        except Exception as e:
            is_valid = False
            context['internal_err'] = 'Invalid contract form data.'

        if not is_valid:
            raise InvalidForm('Form is not valid')

    def validate_data():
        is_valid = True

        # valite if the contract exists in the database
        # and the user who sent is the accepted broker in the contract
        if request_data['contract'] is not None:
            request_data['contract'] = int(request_data['contract'])
            try:
                contract = BrokerBasicUserContract.objects.get(
                    idcontract=request_data['contract'],
                    idbroker=request.user.pk,
                    wasaccepted=1,
                    expirationtime__gt=timezone.now()
                )
                request_data["contract"] = contract

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
    (active_purchase_trade_requests, active_sales_trade_requests, carried_out_requests) \
        = portfolio.fetch_all_users_trade_requests(
        trader=request_data['trader']
    )

    trade_requests = [convert_to_transaction_data_active(req, True) for req in active_purchase_trade_requests] \
                   + [convert_to_transaction_data_active(req, False) for req in active_sales_trade_requests] \
                   + [convert_to_transaction_data_carried_out(req) for req in carried_out_requests]

    logging.info(trade_requests)

    context['transactions'] = trade_requests


def convert_to_transaction_data_active(
    request_: ActiveTradeRequest,
    is_purchase_request: bool
):
    """
        Converts table data into django html tamplate used data.
    """
    data = {
        'is_active': True
    }

    if is_purchase_request:
        request: ActiveTradeRequest = request_.idpurchaserequest
    else:
        request: ActiveTradeRequest = request_.idsalesrequest

    try:
        asset = Asset.objects.get(idasset=request.idasset_id)
        data['ticker'] = asset.tickersymbol
    except Exception as e:
        logging.error('Active trade request without existing idasset')

    quantity_acquired = request.quantityrequested - request.quantityrequired
    data['quantity'] = f'{quantity_acquired}/{request.quantityrequested}'
    data['value'] = request.totaltransactionsprice
    data['type'] = 'BUY' if is_purchase_request else 'SELL'

    return data


def convert_to_transaction_data_carried_out(request: CarriedOutTradeRequest):
    """
        Converts table data into django html tamplate used data.
    """
    data = {
        'is_active': False
    }

    try:
        asset = Asset.objects.get(idasset=request.id_asset)
        data['ticker'] = asset.tickersymbol
    except Exception as e:
        logging.error('Carreid out trade request without existing idasset')

    data['quantity'] = f'{request.quantity}'
    data['value'] = request.total_price
    data['type'] = 'BUY' if request.is_purchase else 'SELL'

    return data
