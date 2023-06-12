"""
    Aleksandar Radenkovic 2020/0272
"""

import logging

from django.http import HttpRequest

from apps.user_management.models import Trader
from apps.asset_management.models import ActiveTradeRequest
from apps.broker_management.models import IsBindedByContract



class InvalidForm(Exception):
    pass



def can_update(
    trader: Trader,
    idtraderequest: int
) -> ActiveTradeRequest:
    """
        Checks if given trader has access to update the
        active trade reqeust with given id and if true then
        returns active_trade_request else returns None.
    """
    # check if the trader owns the request
    active_trade_request = ActiveTradeRequest.objects.get(
        idtraderequest=idtraderequest
    )

    if active_trade_request.iduser == trader:
        return active_trade_request

    # check if the user is the broker behind the request
    if IsBindedByContract.objects.filter(
        idtraderequest=active_trade_request,
        idcontract__idbroker_id=trader.pk
    ).exists():
        return active_trade_request

    return None


def get_cleaned_data_from_trade_request_row(
    request: HttpRequest,
    response: dict[str],
    request_data: dict
):
    def parse_data():
        is_valid = True

        try:  # process idtraderequest
            request_data["trade_request"] = int(request.POST["idtraderequest"])
        except Exception as e:
            is_valid = False
            response['errors'].append('Invalid idtraderequest form data.')

        try:  # process is_purchase_request
            is_purchase_request = request.POST["request_type"]

            if is_purchase_request == 'BUY':
                request_data["is_purchase_request"] = True
            elif is_purchase_request == 'SELL':
                request_data["is_purchase_request"] = False
            else:
                is_valid = False
                response['errors'].append('Unrecognized trade request type.')

        except Exception as e:
            is_valid = False
            response['errors'].append('Invalid is_purchase_request form data.')

        if not is_valid:
            raise InvalidForm('Form is not valid: parse')

    def validate_data():
        is_valid = True

        # Check if given trader can modify the given trade reqeust:

        idtraderequest = request_data['trade_request']
        request_data['trade_request'] = can_update(
            request_data["trader"],
            idtraderequest
        )

        if request_data['trade_request'] is None:
            is_valid = False
            response['errors'].append(f'Unauthorized to modify given trade request')
            logging.error(f'Unauthorized to modify given trade request: {idtraderequest}')

        if not is_valid:
            raise InvalidForm('Form is not valid: validate')


    parse_data()
    validate_data()

    return request_data
