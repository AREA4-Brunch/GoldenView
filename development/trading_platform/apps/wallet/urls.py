from django.urls import path

import apps.wallet.views as views


urlpatterns = [
    path('', views.wallet_status, name='wallet_status'),
    path('update_ftm_form', views.update_transfer_method_form, name='update_transfer_method_form'),
    path('create_ftm', views.create_funds_transfer_method, name='create_funds_transfer_method'),
    path('create_ftm_form', views.create_funds_transfer_method_form, name='create_funds_transfer_method_form'),
]
