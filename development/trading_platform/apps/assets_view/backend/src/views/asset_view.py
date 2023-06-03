from django.http import HttpRequest

from apps.asset_management.models import Asset
from apps.asset_management.backend.src.utils.asset_purchase import send_buy_sell_request
from apps.user_management.models import Trader



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

        if not is_valid:
            raise InvalidBuySellRequestFormException('Form is not valid')


    parse_data()
    validate_data()

    return request_data


def send_buy_sell_request(
    is_buy_request: bool,
    request_data: dict
):
    send_buy_sell_request(
        is_buy_request=is_buy_request,
        trader=request.trader
    )

    return
