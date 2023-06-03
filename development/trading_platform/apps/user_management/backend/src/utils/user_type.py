from apps.user_management.models import User, Trader


def cast_to_trader(user: User):
    if not getattr(user, 'trader', False):
        return None

    trader = user.trader
    if trader and isinstance(trader, Trader):
        return trader

    return None
