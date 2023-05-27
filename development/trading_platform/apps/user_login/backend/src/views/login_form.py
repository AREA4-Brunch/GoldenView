import datetime

from django.http import HttpRequest

from apps.user_management.backend.src.utils.user_login import login_user, LoginWrongCredentialsException
from apps.common.backend.utils.error_handling import internal_error_catcher

from apps.user_management.models import User, Trader



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


def login(user_login_data: dict):
    """
    Raises: LoginWrongCredentialsException
    """
    username = user_login_data['usr']
    password = user_login_data['pwd']
    request = user_login_data['request']

    return login_user(request=request, username=username, password=password)


def did_accept_terms(user: User):
    # let other user types pass such as Admin
    if not isinstance(user, Trader):
        return True

    terms_time = user.termsacceptancetime

    if not terms_time:  # terms were never accepted
        return False
    
    target_date = datetime.date(2023, 5, 1)

    if terms_time.date() < target_date:  # outdated
        return False

    return True
