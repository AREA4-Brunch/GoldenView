# Aleksandar Radenkovic 2020/0272
from django.http import HttpRequest

from apps.user_management.backend.src.utils.user_login import login_user, LoginWrongCredentialsException
from apps.common.backend.utils.error_handling import internal_error_catcher


class InvalidLoginFormException(Exception):
    def __init__(self, *args: object) -> None:
        super().__init__(*args)


# store only the non confidential answers
def store_previous_answers(request: HttpRequest):
    request.session['usr'] = request.POST.get('username')
    request.session.save()


def clear_previous_answers(request: HttpRequest):
    keys_to_pop = [ 'usr' ]

    for key in keys_to_pop:
        try:
            request.session.pop(key)
        except KeyError as e:
            pass

    request.session.save()


def get_cleaned_data(request: HttpRequest):
    user_data = {}

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
            raise InvalidLoginFormException('Form is not valid')

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
