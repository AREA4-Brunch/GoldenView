import logging

from django.shortcuts import render, redirect
from django.http import HttpRequest

from .backend.src.views import register_form as register_form_backend
import apps.user_login.backend.src.views.login_form as login_form


# Create your views here.


def register(request: HttpRequest):
    context = {
        # errors:
        'email_err': request.session.pop('email_err', None),
        'usr_err': request.session.pop('usr_err', None),
        'pwd_err': request.session.pop('pwd_err', None),
        'cntry_err': request.session.pop('cntry_err', None),
        'birthday_err': request.session.pop('birthday_err', None),
        'gender_err': request.session.pop('gender_err', None),

        'internal_err': request.session.pop('gender_err', None),

        # data that is not confidential
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


def register_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        # validate and parse the data from the form,
        # throws if form is invalid
        user_data = register_form_backend.get_cleaned_data(request)

        # register the user
        try:
            register_form_backend.register(user_data)

        except Exception as e:
            request.session['internal_err'] = str(e)
            logging.error(f'Internal error: {e}')
            raise e

    except Exception as e:
        # error message have already been set
        return redirect('register')

    try:
        login_form.login({
            'usr': user_data['usr'],
            'pwd': user_data['pwd'],
        })

    except Exception as e:
        logging.error(f'Failed to login in the user after successful registration.')
        return redirect('login')

    return redirect('disclaimer_page')
