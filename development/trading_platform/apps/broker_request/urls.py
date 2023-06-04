from django.urls import path

import apps.broker_request.views as views


urlpatterns = [
    path('', views.broker_request, name='broker_request'),
    path('broker_request_form', views.broker_request_form, name='broker_request_form'),
]
