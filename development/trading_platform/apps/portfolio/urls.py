"""
    Jovana Bjelica 2020/0349
"""

from django.urls import path

import apps.portfolio.views as views


urlpatterns = [
    path('', views.portfolio, name='portfolio'),
]
