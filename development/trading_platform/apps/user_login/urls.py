from django.urls import path

import apps.user_login.views as views


urlpatterns = [
    path('', views.login, name='login'),
    path('register', views.register, name='register'),
]
