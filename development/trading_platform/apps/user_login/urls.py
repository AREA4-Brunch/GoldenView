# Aleksandar Radenkovic 2020/0272
from django.urls import path

import apps.user_login.views as views


urlpatterns = [
    path('', views.login, name='login'),
    path('login_form', views.login_form, name='login_form'),
]
