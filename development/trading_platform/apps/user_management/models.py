from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin, AbstractUser

# Create your models here.
from apps.asset_management.models import Asset

from datetime import datetime
from django.utils import timezone


class UserManager(BaseUserManager):
    def create_user(self, username, password, email):
        # Create and save a regular user
        user = self.model(
            username=username,
            email=email,
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, username, password, email):
        # Create and save a superuser
        user = self.create_user(
            username=username,
            password=password,
            email=email,
        )
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user


# class User(models.Model):
class User(AbstractUser, PermissionsMixin):
    iduser = models.AutoField(db_column='IdUser', primary_key=True)
    username = models.CharField(db_column='Username', max_length=32, unique=True)
    password = models.CharField(db_column='Password', max_length=128)
    email = models.CharField(db_column='Email', max_length=64, unique=True)

    objects = UserManager()

    USERNAME_FIELD = 'username'
    EMAIL_FIELD = 'email'
    REQUIRED_FIELDS = ['email']

    def deleteRow(self):
        self.delete()

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = True
        db_table = 'user'


class FundsTransferMethod(models.Model):
    idpaymentmethod = models.AutoField(db_column='IdPaymentMethod', primary_key=True)  # Field name made lowercase.
    accesskey = models.CharField(db_column='AccessKey', max_length=64)  # Field name made lowercase.
    makebeliefbalance = models.DecimalField(db_column='MakeBeliefBalance', max_digits=10, decimal_places=2, blank=True, default=0)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = True
        db_table = 'fundstransfermethod'


class MakeBeliefOwns(models.Model):
    idpaymentmethod = models.OneToOneField(FundsTransferMethod, models.DO_NOTHING, db_column='IdPaymentMethod', primary_key=True)  # Field name made lowercase. The composite primary key (IdPaymentMethod, IdAsset) found, that is not supported. The first column is selected.
    idasset = models.ForeignKey(Asset, models.DO_NOTHING, db_column='IdAsset')  # Field name made lowercase.
    quantity = models.IntegerField(db_column='Quantity')  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = True
        db_table = 'makebeliefowns'
        unique_together = (('idpaymentmethod', 'idasset'),)


class Country(models.Model):
    idcountry = models.AutoField(db_column='IdCountry', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=32)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = True
        db_table = 'country'


# class User(models.Model):
# class User(AbstractBaseUser):
#     iduser = models.AutoField(db_column='IdUser', primary_key=True)  # Field name made lowercase.
#     username = models.CharField(db_column='Username', max_length=32)  # Field name made lowercase.
#     password = models.CharField(db_column='Password', max_length=32)  # Field name made lowercase.
#     email = models.CharField(db_column='Email', max_length=64)  # Field name made lowercase.
#
#     class Meta:
#         app_label = 'apps.user_management'
#         app_label = 'user_management'
#         managed = True
#         db_table = 'user'


class Administrator(models.Model):
    idadministrator = models.OneToOneField('User', models.CASCADE, db_column='IdUser', primary_key=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = True
        db_table = 'administrator'


class Trader(models.Model):
    idtrader = models.OneToOneField('User', models.CASCADE, db_column='IdUser', primary_key=True)  # Field name made lowercase.
    birthday = models.DateField(db_column='Birthday', blank=True)  # Field name made lowercase.
    sex = models.CharField(db_column='Sex', max_length=6, blank=True)  # Field name made lowercase.
    idcountry = models.ForeignKey(Country, models.DO_NOTHING, db_column='IdCountry')  # Field name made lowercase.
    termsacceptancetime = models.DateTimeField(db_column='TermsAcceptanceTime', default=timezone.make_aware(datetime(1, 1, 1)))  # Field name made lowercase.
    idselectedfundstrasnfermethod = models.ForeignKey(FundsTransferMethod, models.DO_NOTHING, db_column='IdSelectedFundsTrasnferMethod', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = True
        db_table = 'trader'


class BasicUser(models.Model):
    idbasicuser = models.OneToOneField('Trader', models.CASCADE, db_column='IdUser', primary_key=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = True
        db_table = 'basicuser'


class Broker(models.Model):
    idbroker = models.OneToOneField('user_management.Trader', models.CASCADE, db_column='IdUser', primary_key=True)  # Field name made lowercase.

    class Meta:
        app_label = 'broker_management'
        managed = True
        db_table = 'broker'
