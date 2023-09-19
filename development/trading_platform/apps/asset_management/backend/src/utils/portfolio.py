# Aleksandar Radenkovic 2020/0272

import logging
import mongoengine

from typing import Union
from decimal import Decimal

from django.db.models import Q
from django.db import transaction
from apps.asset_management.models import SalesRequest, PurchaseRequest, \
                                         CarriedOutPurchaseTradeRequest, \
                                         CarriedOutSalesTradeRequest, \
                                         AssetTransaction
from apps.user_management.models import Trader
from apps.broker_management.models import BrokerBasicUserContract

from apps.asset_management.backend.src.utils.trading import process_fulfilled_trade_request



def fetch_users_trade_requests(
    trader: Trader,
    filters={},
    sorted=True
):
    (active_purchase_trade_requests,
     active_sales_trade_requests,
     carried_out_purchase_requests,
     carried_out_sales_requests
    ) = fetch_all_users_trade_requests(trader)

    if sorted:
        # sort by id/time descending
        active_purchase_trade_requests = active_purchase_trade_requests.order_by('-idpurchaserequest')
        active_sales_trade_requests = active_sales_trade_requests.order_by('-idsalesrequest')
        carried_out_purchase_requests = carried_out_purchase_requests.order_by('-id_trade_request')
        carried_out_sales_requests = carried_out_sales_requests.order_by('-id_trade_request')

    # form list of tuples (purchase request, contract id / None)
    def format_active_trade_requests(requests):
        requests = [
            (
                request,
                request.idcontract_id if request.isboundbycontract else None
            )
            for request in requests
        ]
        return requests

    active_purchase_trade_requests \
        = format_active_trade_requests(active_purchase_trade_requests)

    active_sales_trade_requests \
        = format_active_trade_requests(active_sales_trade_requests)

    return (
        active_purchase_trade_requests,
        active_sales_trade_requests,
        carried_out_purchase_requests,
        carried_out_sales_requests,
    )


def fetch_all_users_trade_requests(
    trader: Trader
):
    iduser = trader.idtrader.iduser

    # Fetch all active trade requests of the given user:

    active_purchase_trade_requests = PurchaseRequest.objects.filter(
        # requests where user was the trader or was represented by broker
        Q(iduser_id=iduser)
        # requests where user was somebody's broker
      | Q( Q(isboundbycontract=True) & Q(idcontract__idbroker_id=iduser) )
    )

    active_sales_trade_requests = SalesRequest.objects.filter(
        # requests where user was the trader or was represented by broker
        Q(iduser_id=iduser)
        # requests where user was somebody's broker
      | Q( Q(isboundbycontract=True) & Q(idcontract__idbroker_id=iduser) )
    )

    # Fetch all carried out requests of the given user:
    contracts_ids = BrokerBasicUserContract.objects.filter(
        idbroker_id=iduser
    ).values_list(
        'idcontract',
        flat=True
    )

    carried_out_purchase_requests = CarriedOutPurchaseTradeRequest.objects.filter(
        # requests where user was the trader or was represented by broker
        mongoengine.queryset.visitor.Q(id_user=iduser)
        # requests where user was somebody's broker
      | mongoengine.queryset.visitor.Q(contract__id__in=contracts_ids)
    )

    carried_out_sales_requests = CarriedOutSalesTradeRequest.objects.filter(
        # requests where user was the trader or was represented by broker
        mongoengine.queryset.visitor.Q(id_user=iduser)
        # requests where user was somebody's broker
      | mongoengine.queryset.visitor.Q(contract__id__in=contracts_ids)
    )

    return (
        active_purchase_trade_requests,
        active_sales_trade_requests,
        carried_out_purchase_requests,
        carried_out_sales_requests,
    )


def cancel_active_trade_request(
    trade_request: Union[PurchaseRequest, SalesRequest]
):
    with transaction.atomic():
        # select for update specialization and base
        if isinstance(trade_request, PurchaseRequest):
            trade_request = PurchaseRequest.objects.select_for_update().get(
                idpurchaserequest=trade_request.pk
            )
        else:
            trade_request = SalesRequest.objects.select_for_update().get(
                idsalesrequest=trade_request.pk
            )

        # cancel by simply rendering as fulfilled:
        trade_request.quantityrequested -= trade_request.quantityrequired
        trade_request.quantityrequired = 0
        quantity_at_which_stopped = trade_request.quantityrequested
        value_at_which_stopped = trade_request.totaltransactionsprice

        trade_request.save()

        if not process_fulfilled_trade_request(
            trade_request=trade_request,
        ):
            raise Exception('Upon cancelation process_fulfilled_trade_request returned False !?')

    logging.info('Successfuly cancelled active trade request.')
    return quantity_at_which_stopped, value_at_which_stopped


def modify_active_trade_request(
    trade_request: Union[PurchaseRequest, SalesRequest],
    new_quantityrequested: int=None,
    new_unitpricelowerbound: Decimal=None,
    new_unitpriceupperbound: Decimal=None
):
    with transaction.atomic():
        # select for update specialization and base
        if isinstance(trade_request, PurchaseRequest):
            trade_request = PurchaseRequest.objects.select_for_update().get(
                idpurchaserequest=trade_request.pk
            )
        else:
            trade_request = SalesRequest.objects.select_for_update().get(
                idsalesrequest=trade_request.pk
            )

        if new_unitpricelowerbound is not None:
            trade_request.unitpricelowerbound = new_unitpricelowerbound

        if new_unitpriceupperbound is not None:
            trade_request.unitpriceupperbound = new_unitpriceupperbound

        if not (0 <= trade_request.unitpricelowerbound <= trade_request.unitpriceupperbound):
            raise Exception('Failed check: 0 <= unitpricelowerbound <= unitpriceupperbound')

        if new_quantityrequested is not None:
            trade_request.quantityrequired -= trade_request.quantityrequested - new_quantityrequested
            if trade_request.quantityrequired < 0:
                raise Exception('new_quantityrequested < quantity acquired')

            trade_request.quantityrequested = new_quantityrequested

        quantity_required_at_which_stopped = trade_request.quantityrequired
        quantity_requested_at_which_stopped = trade_request.quantityrequested
        value_at_which_stopped = trade_request.totaltransactionsprice
        lower_bound_at_which_stopped = trade_request.unitpricelowerbound
        upper_bound_at_which_stopped = trade_request.unitpriceupperbound

        trade_request.save()

        did_fulfill = process_fulfilled_trade_request(
            trade_request=trade_request,
        )

    logging.info('Successfuly modified active trade request')
    return quantity_required_at_which_stopped, quantity_requested_at_which_stopped, \
           value_at_which_stopped, lower_bound_at_which_stopped, \
           upper_bound_at_which_stopped, did_fulfill


def fetch_trade_request_transactions(trade_request_id, is_purchase_request):
    if is_purchase_request:
        transactions = AssetTransaction.objects.filter(
            id_trade_request_purchase=trade_request_id,
        ).order_by('-time')
    else:
        transactions = AssetTransaction.objects.filter(
            id_trade_request_sale=trade_request_id,
        ).order_by('-time')

    return transactions
