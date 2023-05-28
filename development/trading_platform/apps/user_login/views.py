import logging

from django.shortcuts import render, redirect
from django.http import HttpRequest

from .backend.src.views import login_form as login_form_backend
from apps.common.backend.utils.error_handling import internal_error_catcher

from apps.user_management.models import User


# Create your views here.


def login(request: HttpRequest):
    # fetch the data from the post
    # if invalid data redirect the
    context = {
        'usr_err': request.session.pop('usr_err', None),
        'pwd_err': request.session.pop('pwd_err', None),

        'internal_err': request.session.pop('internal_err', None),

        'usr': request.session.pop('usr', None),
    }

    return render(
        request=request,
        template_name='user_login/login_page/login_page.html',
        context=context
    )


def login_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        login_form_backend.store_previous_answers(request)

        # validate and parse the data from the form,
        # throws if form is invalid
        user_login_data = login_form_backend.get_cleaned_data(request)
        user_login_data['request'] = request

        # login the user
        try:
            user: User = login_form_backend.login(user_login_data)

        except login_form_backend.LoginWrongCredentialsException as e:
                # invalid username or password
                username = user_login_data.get('usr')
                logging.info(f'Wrong username or password for user: {username}')
                request.session['usr_err'] = 'Wrong username or password'
                raise e

        except Exception as e:
            request.session['internal_err'] = str(e)
            logging.error(f'Internal error: {e}')
            raise e

    except Exception as e:
        # error message have already been set
        logging.error(f'Redirecting to login due to: {e}')
        return redirect('login')

    # successful login

    try:
        login_form_backend.clear_previous_answers(request)

        # if the user has accepted the terms of agreement,
        # redirect to disclaimer page
        if not login_form_backend.did_accept_terms(user):
            return redirect('disclaimer_page')

    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')

    return redirect('home')
