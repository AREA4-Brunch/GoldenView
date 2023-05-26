from django.shortcuts import render, redirect
from django.http import HttpRequest

from .backend.src.views.login_form import validate_login_form
from apps.common.backend.utils.login_user import login_user

# Create your views here.


def login(request: HttpRequest):
    context = {
        'usr_err': request.session.pop('usr_err', None),
        'pwd_err': request.session.pop('pwd_err', None),
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

    # TODO: validate and login
    if not validate_login_form(request):
        return redirect('register')

    # TODO: login the user before home redirect
    login_user()

    return redirect('home')
