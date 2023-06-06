from django.urls import path

import apps.broker_dashboard.views as views


urlpatterns = [
    path('', views.broker_dashboard, name='broker_dashboard_page'),
    path('broker_dashboard_form', views.broker_dashboard_form, name='broker_dashboard_form'),
    path('broker_dashboard_send_request', views.broker_dashboard_send_request, name='broker_dashboard_send_request'),
    path('broker_dashboard_send_request_form', views.broker_dashboard_send_request_form, name='broker_dashboard_send_request_form'),
    path('adminlogout', views.adminlogout, name='adminlogout'),
    
]
