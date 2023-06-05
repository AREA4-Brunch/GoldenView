from django.urls import path

import apps.administrator_dashboard.views as views


urlpatterns = [
    path('', views.administrator_dashboard, name='administrator_dashboard_page'),
    path('administrator_dashboard_form', views.administrator_dashboard_form, name='administrator_dashboard_form'),
    path('administrator_dashboard_request', views.administrator_dashboard_request, name='administrator_dashboard_request'),
    path('administrator_dashboard_request_form', views.administrator_dashboard_request_form, name='administrator_dashboard_request_form')
]