# Aleksandar Radenkovic 2020/0272
from django.urls import path

import apps.user_logout.views as views


urlpatterns = [
    path('', views.logout, name='logout'),
]
