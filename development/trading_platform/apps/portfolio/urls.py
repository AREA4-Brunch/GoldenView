from django.urls import path

import apps.portfolio.views as views


urlpatterns = [
    path('', views.portfolio, name='portfolio'),
]
