from django.shortcuts import render, redirect
from django.http import HttpRequest

from .backend.src.views.register_form import validate_register_form
from apps.common.backend.utils.login_user import login_user

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

        # data that is not confidential
        'usr': request.session.pop('usr', None),
        'email': request.session.pop('email', None),
        'gender': request.session.pop('gender', None),
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

    # TODO: validate and login
    if not validate_register_form(request):
        return redirect('register')

    # TODO: login the user before home redirect
    login_user()

    return redirect('home')
