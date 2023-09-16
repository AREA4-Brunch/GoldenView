# Aleksandar Radenkovic 2020/0272
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager,\
                                       PermissionsMixin, AbstractUser

# Create your models here.
from datetime import datetime
from django.utils import timezone



# function for creatinf users and super users
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


class Country(models.Model):
    idcountry = models.AutoField(db_column='IdCountry', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=32)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = True
        db_table = 'country'


class FundsTransferMethod(models.Model):
    idpaymentmethod = models.AutoField(db_column='IdPaymentMethod', primary_key=True)  # Field name made lowercase.
    idtrader = models.ForeignKey('user_management.Trader', models.DO_NOTHING, db_column='IdTrader', null=False, blank=False)
    accesskey = models.CharField(db_column='AccessKey', max_length=64)  # Field name made lowercase.
    makebeliefbalance = models.DecimalField(db_column='MakeBeliefBalance', max_digits=10, decimal_places=2, blank=True, default=0)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = True
        db_table = 'fundstransfermethod'


class Trader(models.Model):
    idtrader = models.OneToOneField('user_management.User', models.CASCADE, db_column='IdUser', primary_key=True)  # Field name made lowercase.
    birthday = models.DateField(db_column='Birthday', blank=True)  # Field name made lowercase.
    sex = models.CharField(db_column='Sex', max_length=6, blank=True)  # Field name made lowercase.
    idcountry = models.ForeignKey(Country, models.DO_NOTHING, db_column='IdCountry')  # Field name made lowercase.
    termsacceptancetime = models.DateTimeField(db_column='TermsAcceptanceTime', default=timezone.make_aware(datetime(1, 1, 1)))  # Field name made lowercase.
    idselectedfundstransfermethod = models.ForeignKey('user_management.FundsTransferMethod', models.DO_NOTHING, db_column='IdSelectedFundsTransferMethod', null=True, blank=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = True
        db_table = 'trader'


class BasicUser(models.Model):
    idbasicuser = models.OneToOneField('user_management.Trader', models.CASCADE, db_column='IdUser', primary_key=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = True
        db_table = 'basicuser'


class Administrator(models.Model):
    idadministrator = models.OneToOneField('user_management.User', models.CASCADE, db_column='IdUser', primary_key=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = True
        db_table = 'administrator'
