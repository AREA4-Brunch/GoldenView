import logging
import django.shortcuts

from apps.user_management.backend.src.utils.user_terms import did_accept_terms
from apps.user_management.backend.src.utils.user_type import is_trader

from functools import wraps
from django.http import HttpRequest



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
                return is_trader(user) and check(request)

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
                return is_trader(user) and did_accept_terms(user)

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
