# Aleksandar Radenkovic 2020/0272

from apps.asset_management.models import SalesRequest, PurchaseRequest, \
                                         CarriedOutTradeRequest
from apps.user_management.models import Trader


def cancel_active_trade_request():
    return

# function for getting all user trade requests
def fetch_all_users_trade_requests(
    trader: Trader
):
    iduser = trader.idtrader.iduser

    # fetch all active requests by given trader:
    active_purchase_trade_requests = PurchaseRequest.objects.filter(
        idpurchaserequest__iduser=iduser,
    ).order_by(
        'idpurchaserequest'
    )

    active_sales_trade_requests = SalesRequest.objects.filter(
        idsalesrequest__iduser=iduser,
    ).order_by(
        'idsalesrequest'
    )

    # fetch all carried out requests by the user:
    carried_out_requests = CarriedOutTradeRequest.objects(
        id_user=iduser
    )

    return (active_purchase_trade_requests, active_sales_trade_requests, carried_out_requests)
