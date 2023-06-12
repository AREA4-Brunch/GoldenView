"""
    Aleksandar Radenkovic 2020/0272
"""

import logging

from django.http import HttpRequest

from ..utils.cleaning_data import get_cleaned_data_from_trade_request_row


class InvalidForm(Exception):
    pass



def get_cleaned_data(
    request: HttpRequest,
    response: dict[str],
    request_data: dict
):
    request_data = get_cleaned_data_from_trade_request_row(
        request, response, request_data
    )

    def parse_data():
        is_valid = True

        try:  # process lowerbound
            request_data["lowerbound"] = request.POST.get("lowerbound", None)
            if request_data["lowerbound"] is not None:
                request_data["lowerbound"] = float(request_data["lowerbound"])
        except Exception as e:
            is_valid = False
            response['errors'].append('Invalid lowerbound form data.')

        try:  # process upperbound
            request_data["upperbound"] = request.POST.get("upperbound", None)
            if request_data["upperbound"] is not None:
                request_data["upperbound"] = float(request_data["upperbound"])
        except Exception as e:
            is_valid = False
            response['errors'].append('Invalid upperbound form data.')

        try:  # process quantity
            request_data["quantity"] = request.POST.get("quantity", None)
            if request_data["quantity"] is not None:
                request_data["quantity"] = int(request_data["quantity"])
        except Exception as e:
            is_valid = False
            response['errors'].append('Invalid quantity form data.')

        if request_data["lowerbound"] is None and request_data['upperbound'] is None \
        and request_data['quantity'] is None:
            is_valid = False  # no field was set
            response['errors'].append('No field set to update.')

        if not is_valid:
            raise InvalidForm('Form is not valid: parse')

    def validate_data():
        is_valid = True

        # validate the lowerbound:
        if request_data['lowerbound'] is not None and request_data['lowerbound'] <= 0:
            is_valid = False
            response['errors'].append('Invalid lowerbound, it is not positive.')

        # validate the upperbound:
        if request_data['upperbound'] is not None and request_data['upperbound'] <= 0:
            is_valid = False
            response['errors'].append('Invalid upperbound, it is not positive.')

        # validate the quantity:
        if request_data['quantity'] is not None and request_data['quantity'] <= 0:
            is_valid = False
            response['errors'].append('Invalid quantity, it is not positive.')

        if not is_valid:
            raise InvalidForm('Form is not valid: validate')


    parse_data()
    validate_data()

    return request_data
