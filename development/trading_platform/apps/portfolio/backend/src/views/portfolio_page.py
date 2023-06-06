import logging

from django.http import HttpRequest
from django.utils import timezone

from apps.broker_management.models import BrokerBasicUserContract

from apps.asset_management.backend.src.utils import portfolio


class InvalidForm(Exception):
    pass



def get_cleaned_data(
    request: HttpRequest,
    response: dict[str]
):
    request_data = {}

    def parse_data():
        is_valid = True

        try:  # process contract
            request_data["contract"] = request.POST.get("contract", None)
        except Exception as e:
            is_valid = False
            response['contract'].append('Invalid contract form data.')

        if not is_valid:
            raise InvalidForm('Form is not valid')

    def validate_data():
        is_valid = True

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
                logging.exception('Failure man!')

        if not is_valid:
            raise InvalidForm('Form is not valid')


    parse_data()
    validate_data()

    return request_data


def fetch_all_users_trade_requests(request_data: dict):
    (active_trade_requests, carried_out_requests) \
        = portfolio.fetch_all_users_trade_requests(
        trader=request_data['trader']
    )

    active_trade_requests = [req.to_dict() for req in active_trade_requests]
    carried_out_requests = [req.to_json() for req in carried_out_requests]

    return (active_trade_requests, carried_out_requests)
