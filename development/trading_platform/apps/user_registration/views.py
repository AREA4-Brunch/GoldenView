# Jovana Bjelica 2020/0349
import logging

from django.shortcuts import render, redirect
from django.http import HttpRequest

from .backend.src.views import register_form as register_form_backend
import apps.user_login.backend.src.views.login_form as login_form



# Create your views here.

#exception if the user is already loged in
class UserAlreadyLoggedInException(Exception):
    def __init__(self, *args: object) -> None:
        super().__init__('You are already logged in. To register you need to be logged out.')

# request for register
def register(request: HttpRequest):
    is_already_logged_in = request.user and request.user.is_authenticated

    context = {
        # errors:
        'email_err': request.session.pop('email_err', None),
        'usr_err': request.session.pop('usr_err', None),
        'pwd_err': request.session.pop('pwd_err', None),
        'cntry_err': request.session.pop('cntry_err', None),
        'birthday_err': request.session.pop('birthday_err', None),
        'gender_err': request.session.pop('gender_err', None),

        'internal_err': request.session.pop(
                            'internal_err',
                            # if no other error and user already logged in
                            # then notify them to logout first
                            None if not is_already_logged_in \
                            else 'You are already logged in. To register you need to be logged out.'
                        ),

        # fill in form fields with previously
        # entered non confidential data
        'usr': request.session.pop('usr', None),
        'email': request.session.pop('email', None),
        'gender': request.session.pop('gender', None),
        'birthday': request.session.pop('birthday', None),
    }

    return render(
        request=request,
        template_name='user_registration/register_page/register_page.html',
        context=context
    )

# function for the form of the request
def register_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        register_form_backend.store_previous_answers(request)

        # !important check after saving their form answers
        if request.user and request.user.is_authenticated:
            raise UserAlreadyLoggedInException()

        # validate and parse the data from the form,
        # throws if form is invalid
        user_data = register_form_backend.get_cleaned_data(request)

        # register the user
        register_form_backend.register(user_data)

    except UserAlreadyLoggedInException as e:
        request.session['internal_err'] = str(e)
        return redirect('register')

    except register_form_backend.InvalidRegisterFormException as e:
        # error message have already been set
        logging.error(f'Redirecting to register due to: {e}')
        return redirect('register')

    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return redirect('register')

    # successful user creation

    try:
        register_form_backend.clear_previous_answers(request)

        # try to login the user immediately
        login_form.login({
            'usr': user_data['usr'],
            'pwd': user_data['pwd'],
            'request': request,
        })

    except Exception as e:
        logging.exception(f'Failed to login in the user after successful registration: {e}')
        return redirect('login')

    return redirect('disclaimer_page')
