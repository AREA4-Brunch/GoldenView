from django.db.models import F
from apps.user_management.models import FundsTransferMethod
from apps.user_management.models import Trader
from apps.wallet.models import MakeBeliefOwns


def fetch_all_transfer_methods(user_id):
    funds_transfer_methods = FundsTransferMethod.objects.filter(
        idtrader=user_id,
    ).values(
        access_key=F('accesskey'),
        id=F('idpaymentmethod'),
    )

    return funds_transfer_methods


def fetch_all_makebeliefowns_assets(idpaymentmethod):
    assets_owned = MakeBeliefOwns.objects.filter(
        idpaymentmethod=idpaymentmethod
    ).values(
        'quantity',
        ticker=F('idasset__tickersymbol'),
    )

    return assets_owned
