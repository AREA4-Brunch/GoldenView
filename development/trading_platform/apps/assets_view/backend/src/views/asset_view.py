import logging

from django.http import HttpRequest

from apps.asset_management.models import Asset
from apps.asset_management.backend.src.utils.trading import create_buy_sell_request, \
                                                            match_traders_request



class InvalidBuySellRequestFormException(Exception):
    def __init__(self, *args: object) -> None:
        super().__init__(*args)


def get_cleaned_data(
    request: HttpRequest,
    response: dict[str]
):
    request_data = {}

    def parse_data():
        is_valid = True

        try:  # process quantity
            request_data["quantity"] = int(request.POST["quantity"])
        except Exception as e:
            is_valid = False
            response['errors'].append('Invalid quantity form data.')

        try:  # process min
            request_data["min"] = float(request.POST["min"])
        except Exception as e:
            is_valid = False
            response['errors'].append('Invalid min range value form data.')

        try:  # process max
            request_data["max"] = float(request.POST["max"])
        except Exception as e:
            is_valid = False
            response['errors'].append('Invalid max range value form data.')

        try:  # process ticker
            request_data["asset"] = request.POST["ticker"]
        except Exception as e:
            is_valid = False
            response['errors'].append('Invalid ticker form data.')

        # TODO: handle contracts of broker in name of user
        request_data['contract'] = None

        if not is_valid:
            raise InvalidBuySellRequestFormException('Form is not valid')

    def validate_data():
        is_valid = True

        # validate the quantity:
        if request_data['quantity'] <= 0:
            is_valid = False
            response['errors'].append('Invalid quantity, it is negative.')

        # validate the range
        if request_data['min'] > request_data['max']:
            is_valid = False
            response['errors'].append('Invalid range, max < min.')

        # valite if the ticker exists in the database
        try:
            asset = Asset.objects.get(tickersymbol=request_data['asset'])
            request_data["asset"] = asset

        except Exception as e:
            is_valid = False
            response['errors'].append('Failed to find the asset requested.')

        # TODO: handle contracts of broker in name of user

        if not is_valid:
            raise InvalidBuySellRequestFormException('Form is not valid')


    parse_data()
    validate_data()

    return request_data


def send_buy_sell_request(
    is_purchase_request: bool,
    request_data: dict
    # response: dict[str]
):
    try:
        request = create_buy_sell_request(
            is_purchase_request=is_purchase_request,
            trader=request_data['trader'],
            asset=request_data['asset'],
            quantity=request_data['quantity'],
            price_lower_bound=request_data['min'],
            price_upper_bound=request_data['max'],
            contract=request_data['contract']
        )

    except Exception as e:
        # just reraise and the error should be handled by view
        # response['errors'].append(str(e))
        raise e

    try:
        # queue up the task that matches buy and sell request
        # as now the change in db happened:
        match_traders_request(is_purchase_request=is_purchase_request,
                              request_id=request.idtraderequest)
        # match_traders_request(is_purchase_request=False, request_id=9)

    except Exception as e:
        # Internal error that user should not be notified about
        logging.error('Failed to queue up the requests matcher call')
