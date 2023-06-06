from django.urls import path

import apps.user_dashboard.views as views


urlpatterns = [
    path('', views.user_dashboard, name='user_dashboard_page'),
    path('user_dashboard_form', views.user_dashboard_form, name='user_dashboard_form'),
    path('user_dashboard_send_request', views.user_dashboard_send_request, name='user_dashboard_send_request'),
    path('user_dashboard_send_request_accept_form', views.user_dashboard_send_request_accept_form, name='user_dashboard_send_request_accept_form'),
    path('user_dashboard_send_request_decline_form', views.user_dashboard_send_request_decline_form, name='user_dashboard_send_request_decline_form'),
    path('user_dashboard_send_request_cancel_form', views.user_dashboard_send_request_cancel_form, name='user_dashboard_send_request_cancel_form'),
    path('adminlogout', views.adminlogout, name='adminlogout'),
    
]
