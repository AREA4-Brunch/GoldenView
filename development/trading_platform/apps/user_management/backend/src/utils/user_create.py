import logging

from django.db import transaction
from django.core.exceptions import ObjectDoesNotExist
from apps.user_management.models import User, Trader, BasicUser, Country

from django.contrib.auth.models import Group


def create_basic_user(email, username, password, birthday, gender, country):
    """
        email: `Micheal@f.com`
        username: `2121`
        password: `212112`
        birthday: `1992-05-16`
        gender: `Other`
        country: `us`
    """

    try:
        country_obj = Country.objects.get(name=country)

    except ObjectDoesNotExist as e:
        logging.error(f"Country with name `{country}` does not exist.")
        raise e

    # Create a transaction to ensure data consistency
    with transaction.atomic():
        try:
            user = User.objects.create_user(
                username=username,
                password=password,
                email=email,
            )

            # add the user to the group of authorized to trade
            group = Group.objects.get(name='can_trade')
            user.groups.add(group)
            user.save()
    
            trader = Trader.objects.create(
                idtrader=user,
                birthday=birthday,
                sex=gender,
                idcountry=country_obj,
            )

            basic_user = BasicUser.objects.create(idbasicuser=trader)

            logging.info(f"BasicUser `{username}` created successfully.")
            return basic_user

        except Exception as e:
            import traceback
            logging.error(f"Error creating BasicUser: {e}")
            print(traceback.format_exc())
            raise e
