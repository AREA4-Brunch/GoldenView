from apps.user_management.models import User, Trader, Broker


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