import datetime
from apps.user_management.models import Trader


def did_accept_terms(user: Trader):
    if user is None: return False

    # date of last terms update by our legal team :)
    target_date = datetime.date(2023, 6, 1)
    terms_time = user.termsacceptancetime

    # !important strictly greater than
    return terms_time is not None and terms_time.date() > target_date


def accept_terms(user: Trader):

    # ovde iz nekog razloga nece da sacuva ne znam koji je problem
    #birthday i country ne valjaju iz nekog razloga

    user.termsacceptancetime=datetime.date.today()
    user.birthday=user.birthday
    user.idcountry=user.idcountry

    #trader has no idcountry nakon 22. i 23. linije

    user.save()