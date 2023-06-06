from apps.asset_management.models import ActiveTradeRequest, \
                                         CarriedOutTradeRequest
from apps.user_management.models import Trader


def cancel_active_trade_request():
    return


def fetch_all_users_trade_requests(
    trader: Trader
):
    iduser = trader.idtrader.iduser

    # fetch all active requests by given trader:
    active_trade_requests = ActiveTradeRequest.objects.filter(
        iduser=iduser
    )
    # active_trade_requests = [req.to_dict() for req in active_trade_requests]

    # fetch all carried out requests by the user:
    carried_out_requests = CarriedOutTradeRequest.objects(
        id_user=iduser
    )
    # carried_out_requests = [req.to_json() for req in carried_out_requests]

    return (active_trade_requests, carried_out_requests)




