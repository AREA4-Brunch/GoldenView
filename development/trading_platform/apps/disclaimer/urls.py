from django.urls import path

import apps.disclaimer.views as views


urlpatterns = [
    path('', views.terms_of_agreement, name='disclaimer_page')
]
