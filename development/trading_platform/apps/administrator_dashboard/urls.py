# Jovan Jovanovic 2020/0083
from django.urls import path

import apps.administrator_dashboard.views as views


urlpatterns = [
    path('', views.administrator_dashboard, name='administrator_dashboard_page'),
    path('administrator_dashboard_form', views.administrator_dashboard_form, name='administrator_dashboard_form'),
    path('administrator_dashboard_request', views.administrator_dashboard_request, name='administrator_dashboard_request'),
    path('administrator_dashboard_request_delete_form', views.administrator_dashboard_request_delete_form, name='administrator_dashboard_request_delete_form'),
    path('administrator_dashboard_request_approve_form', views.administrator_dashboard_request_approve_form, name='administrator_dashboard_request_approve_form'),
    path('adminlogout', views.adminlogout, name='adminlogout'),
]
