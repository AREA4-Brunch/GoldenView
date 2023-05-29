from django.http import HttpRequest
from django.contrib.auth import logout


def logout_user(request: HttpRequest):
    logout(request)
