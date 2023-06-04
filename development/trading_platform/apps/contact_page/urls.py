from django.urls import path

import apps.contact_page.views as views


urlpatterns = [
    path('', views.contact_page, name='contact_page_page'),
    path('form_contact_page', views.form_contact_page, name='form_contact_page'),
]
