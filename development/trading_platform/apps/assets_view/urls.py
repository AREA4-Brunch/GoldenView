# Andrej Dujovic 2020/0306
from django.urls import path

import apps.assets_view.views as views


urlpatterns = [
    path('', views.assets_list, name='assets_list'),
    path('asset/<str:symbol>', views.asset_view, name='asset_view'),
    path('buy', views.buy_asset, name='asset_buy'),
    path('sell', views.sell_asset, name='asset_sell'),
]
