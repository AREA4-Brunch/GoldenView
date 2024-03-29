from django.http import HttpRequest
from django.contrib.auth import login, authenticate


class LoginWrongCredentialsException(Exception):
    def __init__(self, *args: object) -> None:
        super().__init__(*args)


def login_user(request: HttpRequest, username: str, password: str):
    """
    Raises: LoginWrongCredentialsException
    """
    user = authenticate(request, username=username, password=password)

    if not user:  # invalid credentials
        raise LoginWrongCredentialsException()

    login(request, user)
    return user
