from apps.user_management.models import User


def is_trader(user: User):
    return getattr(user, 'idtrader', False)
