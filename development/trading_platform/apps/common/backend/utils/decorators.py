# Aleksandar Radenkovic 2020/0272
import logging
import django.shortcuts

from apps.user_management.backend.src.utils.user_terms import did_accept_terms
from apps.user_management.backend.src.utils.user_type import cast_to_trader

from functools import wraps
from django.http import HttpRequest

from apps.user_management.models import User


# check if the user is a trader
def if_trader_check(check, redirect, raise_exception=True):
    """
        If request.user is None raises exception
        (which can be ignored with `raise_exception`=False),
        else if user is not a Trader just passes,
        else if check(request) == True just passes
        else redirects to given `redirect` view.
    """
    def decorator(view_func):
        @wraps(view_func)
        def wrapped_view(request: HttpRequest, *args, **kwargs):
            def has_access(user):
                if user is None: raise Exception('user is none');
                return cast_to_trader(user) is not None and check(request)

            try:
                if has_access(request.user):
                    return view_func(request, *args, **kwargs)

                return django.shortcuts.redirect(redirect)

            except Exception as e:
                if raise_exception:
                    logging.error(f'Error @if_trader_accept_terms_required: {e}')
                    raise e;

        return wrapped_view
    return decorator

def if_trader_accept_terms_required(
    redirect='disclaimer_page',
    raise_exception=True
):
    """
        If request.user is None raises exception
        (which can be ignored with `raise_exception`=False),
        else if user is a Trader and did not accept most
        rescent terms then redirects to given `redirect` view,
        else just passes.
    """
    def decorator(view_func):
        @wraps(view_func)
        def wrapped_view(request: HttpRequest, *args, **kwargs):
            def has_access(user):
                if user is None: raise Exception('user is none');
                trader = cast_to_trader(user)
                return trader is not None and did_accept_terms(trader)

            try:
                if has_access(request.user):
                    return view_func(request, *args, **kwargs)

                return django.shortcuts.redirect(redirect)

            except Exception as e:
                if raise_exception:
                    logging.error(f'Error @if_trader_accept_terms_required: {e}')
                    raise e

        return wrapped_view
    return decorator


def can_user_trade(user: User):
    return user.groups.filter(name='can_trade').exists()
