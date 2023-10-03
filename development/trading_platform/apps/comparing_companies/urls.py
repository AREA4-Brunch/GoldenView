from django.urls import path

import apps.comparing_companies.views as views


urlpatterns = [
    path('', views.comparing_companies, name='comparing_companies'),
]
