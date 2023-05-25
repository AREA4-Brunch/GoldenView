from django.urls import path

import apps.common.backend.views as views


urlpatterns = [
    path('404', views.page_404, name='page_404'),
]
