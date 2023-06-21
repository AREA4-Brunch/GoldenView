# Aleksandar Radenkovic 2020/0272
from django.urls import path

import apps.common.backend.views as views


urlpatterns = [
    path('404', views.page_404, name='page_404'),
    path('dashboard_redirect', views.dashboard_redirect, name='dashboard_redirect'),
]
