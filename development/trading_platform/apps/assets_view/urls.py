from django.urls import path

import apps.assets_view.views as views


urlpatterns = [
    path('', views.assets_list, name='assets_list'),
    path('<int:asset_id>', views.asset_view, name='asset_view'),
]
