"""
    Jovana Bjelica 2020/0349
"""

from django.urls import path

import apps.portfolio.views as views


urlpatterns = [
    path('', views.portfolio, name='portfolio'),
    path('cancel', views.cancel_active_trade_request, name='cancel_active_trade_request'),
    path('modify', views.modify_active_trade_request, name='modify_active_trade_request'),
    path('details', views.view_trade_request_details, name='view_trade_request_details'),
]
