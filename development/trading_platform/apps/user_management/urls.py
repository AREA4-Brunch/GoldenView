from django.urls import path

from apps.user_management.backend.src.views.user_create import UserCreateEndpoint


urlpatterns = [
    path('create', UserCreateEndpoint.as_view(), name='create_user'),
]
