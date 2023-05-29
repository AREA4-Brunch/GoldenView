from django.urls import path

import apps.disclaimer.views as views


urlpatterns = [
    path('', views.terms_of_agreement, name='disclaimer_page'),
    path('', views.accept_terms_form, name='accept_terms_form'),
]
