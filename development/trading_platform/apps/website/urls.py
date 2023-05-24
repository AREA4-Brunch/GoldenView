from django.urls import path

import apps.website.views as views


urlpatterns = [
    path('', views.home, name='home')
]
