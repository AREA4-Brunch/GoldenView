# Jovan Jovanovic 2020/0083
from django.urls import path

import apps.disclaimer.views as views


urlpatterns = [
    path('', views.terms_of_agreement, name='disclaimer_page'),
    path('accept_terms_form', views.accept_terms_form, name='accept_terms_form'),
]
