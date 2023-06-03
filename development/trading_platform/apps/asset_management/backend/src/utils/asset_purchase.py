from apps.asset_management.models import Asset
from apps.user_management.models import Trader


def send_buy_sell_request(
    is_buy_request: bool,
    trader: Trader,
    asset: Asset,
    quantity: int,
    price_lower_bound: int,
    price_upper_bound: int
):
    """
    Sends request for purchasing an asset.

    Args:
        is_buy_request (bool): Whether the request for purhase or sale.
        trader (Trader): Trader whose bank account will be used.
        asset (Asset): Asset being purchased.
        quantity (int): Assumes > 0.
        price_lower_bound (int): Min unit price that is found acceptable for
                                 purchase of given asset.
        price_upper_bound (int): Max unit price that is foundacceptable for
                                 purchase of given asset.
                                 Assumes price_upper_bound
                                      >= price_lower_bound
    """

    return
