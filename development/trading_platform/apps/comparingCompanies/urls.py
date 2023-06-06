from django.urls import path

import apps.comparingCompanies.views as views


urlpatterns = [
    path('', views.comparingCompanies, name='comparingCompanies'),
]
