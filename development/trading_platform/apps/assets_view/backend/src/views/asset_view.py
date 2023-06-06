# Andrej Dujovic 2020/0306
import logging

from django.http import HttpRequest
from django.utils import timezone

from apps.asset_management.models import Asset
from apps.asset_management.backend.src.utils.trading import create_buy_sell_request, \
                                                            match_traders_request, \
                                                            process_all_active_requests
from apps.broker_management.models import BrokerBasicUserContract

# exception for invalid form filled
class InvalidBuySellRequestFormException(Exception):
    def __init__(self, *args: object) -> None:
        super().__init__(*args)

# getting data
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

        try:  # process contract
            request_data["contract"] = int(request.POST.get("contract", None))
        except Exception as e:
            is_valid = False
            response['errors'].append('Invalid contract form data.')

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

        # valite if the contract exists in the database
        # and the user who sent is the accepted broker in the contract
        if request_data['contract'] is not None:
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
                response['errors'].append('Failed to find the contract requested.')
                logging.error('Failed to find the contract requested.')

        if not is_valid:
            raise InvalidBuySellRequestFormException('Form is not valid')


    parse_data()
    validate_data()

    return request_data

# requet to send or buy an asset
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
    except Exception as e:
        # process_all_active_requests()
        # Internal error that user should not be notified about
        logging.error('Failed to queue up the requests matcher call')
