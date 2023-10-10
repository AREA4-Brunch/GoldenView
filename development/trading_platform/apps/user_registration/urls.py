from django.urls import path

import apps.user_registration.views as views


urlpatterns = [
    path('', views.register, name='register'),
    path('register_form', views.register_form, name='register_form'),
]
