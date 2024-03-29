# Jovana Bjelica 2020/0349
from django.urls import path

import apps.password_reset.views as views


urlpatterns = [
    path('', views.password_reset, name='password_reset'),
    path('password_reset_form', views.password_reset_form, name='password_reset_form'),
    path('cancel_reset', views.cancel_reset, name='cancel_reset'),
]
