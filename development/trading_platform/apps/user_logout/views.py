from django.http import HttpRequest
from django.shortcuts import render, redirect

from apps.user_management.backend.src.utils.user_logout import logout_user
from django.contrib.auth.decorators import login_required


# Create your views here.


@login_required(login_url='login')
def logout(request: HttpRequest):
    logout_user(request)
    return redirect('login')
