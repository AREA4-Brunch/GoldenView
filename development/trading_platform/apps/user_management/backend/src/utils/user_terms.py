import datetime
from apps.user_management.models import User


def did_accept_terms(user: User):
    if user is None: return False;

    # date of last terms update by our legal team :)
    target_date = datetime.date(2023, 6, 1)
    terms_time = user.termsacceptancetime

    # !important strictly greater than
    return terms_time is not None and terms_time.date() > target_date


def accept_terms(user: User):
    pass
