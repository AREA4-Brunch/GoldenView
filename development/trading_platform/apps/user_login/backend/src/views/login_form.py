from django.http import HttpRequest

from apps.user_management.backend.src.utils.user_login import login_user
from apps.common.backend.utils.error_handling import internal_error_catcher


def get_cleaned_data(request: HttpRequest):
    user_data = {}

    # store only the non confidential answers
    def store_previous_answers():
        request.session['usr'] = request.POST.get('usr')

    def parse_data():
        is_valid = True

        try:  # process username
            user_data["usr"] = request.POST["username"]
        except Exception as e:
            is_valid = False
            request.session['usr_err'] = 'Invalid username'

        try:  # process password
            user_data["pwd"] = request.POST["password"]
        except Exception as e:
            is_valid = False
            request.session['pwd_err'] = 'Invalid password'

        if not is_valid:
            store_previous_answers()
            raise Exception('Form is not valid')

    def main():
        parse_data()

    internal_error_catcher(request, main)

    return user_data


def login(user_data: dict):
    username = user_data['usr']
    password = user_data['pwd']

    login_user(username=username, password=password)
    return
