# Aleksandar Radenkovic 2020/0272
import logging

from django.shortcuts import render, redirect
from django.http import HttpRequest

from .backend.src.views import login_form as login_form_backend

from apps.user_management.models import User


# Create your views here.


# exception if the user is already registered
class UserAlreadyLoggedInException(Exception):
    def __init__(self, *args: object) -> None:
        super().__init__('You are already logged in. To login you need to be logged out.')


# request for login
def login(request: HttpRequest):
    is_already_logged_in = request.user and request.user.is_authenticated

    context = {
        'usr_err': request.session.pop('usr_err', None),
        'pwd_err': request.session.pop('pwd_err', None),

        'internal_err': request.session.pop(
                            'internal_err',
                            # if no other error and user already logged in
                            # then notify them to logout first
                            None if not is_already_logged_in \
                            else 'You are already logged in. To login you need to be logged out.'
                        ),

        # fill in form fields with previously entered non confidential data
        'usr': request.session.pop('usr', None),
    }

    return render(
        request=request,
        template_name='user_login/login_page/login_page.html',
        context=context
    )

# function for the form for user login
def login_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        login_form_backend.store_previous_answers(request)

        # !important check after saving their form answers
        if request.user and request.user.is_authenticated:
            raise UserAlreadyLoggedInException()

        # validate and parse the data from the form,
        # throws if form is invalid
        user_login_data = login_form_backend.get_cleaned_data(request)
        user_login_data['request'] = request

        # login the user
        user: User = login_form_backend.login(user_login_data)

    except UserAlreadyLoggedInException as e:
        request.session['internal_err'] = str(e)
        return redirect('login')

    except login_form_backend.LoginWrongCredentialsException as e:
        # invalid username or password
        username = user_login_data.get('usr')
        logging.info(f'Wrong username or password for user: {username}')
        request.session['usr_err'] = 'Wrong username or password'
        return redirect('login')

    except login_form_backend.InvalidLoginFormException as e:
        # error message have already been set
        logging.error(f'Redirecting to login due to: {e}')
        return redirect('login')

    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return redirect('login')

    # successful login

    try:
        # clear the form data from the request.session
        login_form_backend.clear_previous_answers(request)

    except Exception as e:
        # request.session['internal_err'] = str(e)
        logging.error(f'Ignored error - clear login form data: {e}')

    finally:
        return redirect('home')
