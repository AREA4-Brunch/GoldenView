import logging

from django.shortcuts import render, redirect
from django.http import HttpRequest

from .backend.src.views import login_form as login_form_backend


# Create your views here.


def login(request: HttpRequest):
    # fetch the data from the post
    # if invalid data redirect the
    context = {
        'usr_err': request.session.pop('usr_err', None),
        'pwd_err': request.session.pop('pwd_err', None),

        'internal_err': request.session.pop('gender_err', None),

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
        # validate and parse the data from the form,
        # throws if form is invalid
        user_data = login_form_backend.get_cleaned_data(request)

        # login the user
        try:
            login_form_backend.login(user_data)

        except Exception as e:
            request.session['internal_err'] = str(e)
            logging.error(f'Internal error: {e}')
            raise e

    except Exception as e:
        # error message have already been set
        return redirect('login')

    # check if the user has accepted the terms of agreement, else
    # perhaps redirect to disclaimer page

    return redirect('home')
