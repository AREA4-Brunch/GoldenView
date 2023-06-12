# Aleksandar Radenkovic 2020/0272

import logging
import mongoengine

from decimal import Decimal

from django.db.models import Q
from django.db import transaction

from apps.asset_management.models import SalesRequest, PurchaseRequest, \
                                         CarriedOutTradeRequest, \
                                         ActiveTradeRequest
from apps.user_management.models import Trader
from apps.broker_management.models import BrokerBasicUserContract

from apps.asset_management.backend.src.utils.trading import process_fulfilled_trade_request



# function for getting all user trade requests
def fetch_users_trade_requests(
    trader: Trader,
    filters: dict[str]={}
):
    (active_purchase_trade_requests, active_sales_trade_requests, carried_out_requests) \
        = fetch_all_users_trade_requests(trader)

    # apply filters here (not requested by documentation but for possible modif):
    #     user_being_traded_for = filters['contract'].idbasicuser.idbasicuser
    # if contract is not None:
    #     return fetch_users_contract_binded_trade_requests(
    #         trader=trader,
    #         contract=contract
    #     )

    return (active_purchase_trade_requests, active_sales_trade_requests, carried_out_requests)


def fetch_all_users_trade_requests(
    trader: Trader
):
    """
        Returns 
    """
    iduser = trader.idtrader.iduser

    # Fetch all active trade requests of the given user:

    active_purchase_trade_requests = PurchaseRequest.objects.filter(
        # requests where user was the trader or was represented by broker
        Q(idpurchaserequest__iduser=iduser)
        # requests where user was somebody's broker
      | Q(idpurchaserequest__isbindedbycontract__idcontract__idbroker_id=iduser)
    ).prefetch_related(
        'idpurchaserequest__idtraderequest__isbindedbycontract_set'
    )

    active_sales_trade_requests = SalesRequest.objects.filter(
        # requests where user was the trader or was represented by broker
        Q(idsalesrequest__iduser=iduser)
        # requests where user was somebody's broker
      | Q(idsalesrequest__isbindedbycontract__idcontract__idbroker_id=iduser)
    ).prefetch_related(
        'idsalesrequest__idtraderequest__isbindedbycontract_set'
    )

    # form list of tuples (purchase request, contractr id / None)
    active_purchase_trade_requests = [
        (
            request,
            request.idpurchaserequest.isbindedbycontract.idcontract.idcontract if hasattr(
                request.idpurchaserequest, 'isbindedbycontract'
            ) else None
        )
        for request in active_purchase_trade_requests
    ]

    # form list of tuples (sales request, contractr id / None)
    active_sales_trade_requests = [
        (
            request,
            request.idsalesrequest.isbindedbycontract.idcontract.idcontract if hasattr(
                request.idsalesrequest, 'isbindedbycontract'
            ) else None
        )
        for request in active_sales_trade_requests
    ]

    # Fetch all carried out requests of the given user:
    contracts_ids = BrokerBasicUserContract.objects.filter(
        idbroker_id=iduser
    ).values_list(
        'idcontract',
        flat=True
    )

    carried_out_trade_requests = CarriedOutTradeRequest.objects.filter(
        # requests where user was the trader or was represented by broker
        mongoengine.queryset.visitor.Q(id_user=iduser)
        # requests where user was somebody's broker
      | mongoengine.queryset.visitor.Q(contract__id__in=contracts_ids)
    )

    return (active_purchase_trade_requests, active_sales_trade_requests, carried_out_trade_requests)


def cancel_active_trade_request(
    trade_request: ActiveTradeRequest,
    is_purchase_request: bool
):
    with transaction.atomic():
        # select for update specialization and base
        if is_purchase_request:
            trade_request_spec = PurchaseRequest.objects.select_for_update().get(
                idpurchaserequest=trade_request
            )
        else:
            trade_request_spec = SalesRequest.objects.select_for_update().get(
                idsalesrequest=trade_request
            )

        trade_request = ActiveTradeRequest.objects.select_for_update().get(
            idtraderequest=trade_request.idtraderequest
        )

        # cancel by simply rendering as fulfilled:
        trade_request.quantityrequested -= trade_request.quantityrequired
        trade_request.quantityrequired = 0
        quantity_at_which_stopped = trade_request.quantityrequested
        value_at_which_stopped = trade_request.totaltransactionsprice

        # no update to spec as nothing in it was changed
        trade_request.save()

        if not process_fulfilled_trade_request(
            trade_request_spec=trade_request_spec,
            trade_request=trade_request
        ):
            raise Exception('Upon cancelation process_fulfilled_trade_request returned False !?')

    logging.info('Successfuly cancelled active trade request: ')
    return quantity_at_which_stopped, value_at_which_stopped


def modify_active_trade_request(
    trade_request: ActiveTradeRequest,
    is_purchase_request: bool,
    new_quantityrequested: int=None,
    new_unitpricelowerbound: Decimal=None,
    new_unitpriceupperbound: Decimal=None
):
    with transaction.atomic():
        # select for update specialization and base
        if is_purchase_request:
            trade_request_spec = PurchaseRequest.objects.select_for_update().get(
                idpurchaserequest=trade_request
            )
        else:
            trade_request_spec = SalesRequest.objects.select_for_update().get(
                idsalesrequest=trade_request
            )

        trade_request = ActiveTradeRequest.objects.select_for_update().get(
            idtraderequest=trade_request.idtraderequest
        )

        if new_unitpricelowerbound is not None:
            trade_request_spec.unitpricelowerbound = new_unitpricelowerbound

        if new_unitpriceupperbound is not None:
            trade_request_spec.unitpriceupperbound = new_unitpriceupperbound

        if not (0 <= trade_request_spec.unitpricelowerbound <= trade_request_spec.unitpriceupperbound):
            raise Exception('Failed check: 0 <= unitpricelowerbound <= unitpriceupperbound')

        if new_quantityrequested is not None:
            trade_request.quantityrequired -= trade_request.quantityrequested - new_quantityrequested
            if trade_request.quantityrequired < 0:
                raise Exception('new_quantityrequested < quantity acquired')

            trade_request.quantityrequested = new_quantityrequested

        quantity_required_at_which_stopped = trade_request.quantityrequired
        quantity_requested_at_which_stopped = trade_request.quantityrequested
        value_at_which_stopped = trade_request.totaltransactionsprice
        lower_bound_at_which_stopped = trade_request_spec.unitpricelowerbound
        upper_bound_at_which_stopped = trade_request_spec.unitpriceupperbound

        trade_request_spec.save()
        trade_request.save()

        did_fulfill = process_fulfilled_trade_request(
            trade_request_spec=trade_request_spec,
            trade_request=trade_request
        )

    logging.info('Successfuly cancelled active trade request: ')
    return quantity_required_at_which_stopped, quantity_requested_at_which_stopped, \
           value_at_which_stopped, lower_bound_at_which_stopped, \
           upper_bound_at_which_stopped, did_fulfill
