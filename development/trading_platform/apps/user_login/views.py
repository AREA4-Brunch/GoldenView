from django.shortcuts import render

# Create your views here.


def login(request):
    return render(
        request=request,
        template_name='user_login/login_page/login_page.html',
    )


def register(request):
    return render(
        request=request,
        template_name='user_login/register/register.html',
    )
