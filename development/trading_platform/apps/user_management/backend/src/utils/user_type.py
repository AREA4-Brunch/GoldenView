from apps.user_management.models import BasicUser, User, Trader, Administrator
from apps.broker_management.models import Broker


def cast_to_trader(user: User):
    if not getattr(user, 'trader', False):
        return None

    trader = user.trader
    if trader and isinstance(trader, Trader):
        return trader

    return None

def cast_to_broker(user: User):
    user = cast_to_trader(user)
    if(user==None): return None

    if not getattr(user, 'broker', False):
        return None

    broker = user.broker
    if broker and isinstance(broker, Broker):
        return broker

    return None

def cast_to_basic(user: User):
    for basicuser in BasicUser.objects.all():
        if user==basicuser.idbasicuser.idtrader:
            return basicuser
    return None


def cast_to_administrator(user: User):
    if not getattr(user, 'administrator', False):
        return None

    administrator = user.administrator
    if administrator and isinstance(administrator, Administrator):
        return administrator

    return None
