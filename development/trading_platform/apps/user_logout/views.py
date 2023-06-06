# Aleksandar Radenkovic 2020/0272
from django.http import HttpRequest
from django.shortcuts import render, redirect

from apps.user_management.backend.src.utils.user_logout import logout_user
from django.contrib.auth.decorators import login_required


# for testing
from apps.asset_management.backend.src.utils.asset_predictions import *
from datetime import date

# Create your views here.

#logout user
@login_required(login_url='login')
def logout(request: HttpRequest):
    logout_user(request)
    return redirect('login')
