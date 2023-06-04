import logging

from django.db import transaction
from django.db.models import BigIntegerField

from apps.user_management.models import Trader
from apps.asset_management.models import Asset, ActiveTradeRequest, \
                                         PurchaseRequest, SalesRequest
from apps.broker_management.models import BrokerBasicUserContract, \
                                          IsBindedByContract


def create_buy_sell_request(
    is_purchase_request: bool,
    trader: Trader,
    asset: Asset,
    quantity: int,
    price_lower_bound: int,
    price_upper_bound: int,
    contract: BrokerBasicUserContract=None
):
    """
    Sends request for purchasing an asset.

    Args:
        is_purchase_request (bool): Whether the request for purhase or sale.
        trader (Trader): Trader whose bank account will be used.
        asset (Asset): Asset being purchased.
        quantity (int): Assumes > 0.
        price_lower_bound (int): Min unit price that is found acceptable for
                                 purchase of given asset.
        price_upper_bound (int): Max unit price that is foundacceptable for
                                 purchase of given asset.
                                 Assumes price_upper_bound
                                      >= price_lower_bound
        contract (BrokerBasicUserContract) [Optional]: Contract under which
                                                       this request is being
                                                       made by a broker for
                                                       given user (trader).
    """

    # create the request in the database
    with transaction.atomic():
        request = ActiveTradeRequest.objects.create(
            idasset=asset,
            iduser=trader,
            quantityrequested=quantity,
            # totaltransactionsprice=0.,  # default
            quantityrequired=quantity,
            unitpricelowerbound=price_lower_bound,
            unitpriceupperbound=price_upper_bound
        )

        if is_purchase_request:
            PurchaseRequest.objects.create(idpurchaserequest=request)
        else:
            SalesRequest.objects.create(idsalesrequest=request)

        # store if binded by contract, (only for active requests)
        if contract is not None:
            IsBindedByContract.objects.create(
                idtraderequest=request,
                idcontract=contract
            )

        return request


def match_traders_request(
    is_purchase_request: bool,
    request_id: BigIntegerField
):
    logging.info(f'Matching traders request: {is_purchase_request}, id={request_id}')
    # with transaction.atomic():
    #     # check if the request is still active (was not already matched)
    #     if is_purchase_request:
    #         request = PurchaseRequest.objects.filter(idpurchaserequest=request_id)
    #         opposite_table = SalesRequest
    #     else:
    #         request = SalesRequest.objects.filter(idsalesrequest=request_id)
    #         opposite_table = PurchaseRequest

    #     if request is None:  # request is no longer active
    #         return;

    #     # find the request that matches it in the opposite table



    return

