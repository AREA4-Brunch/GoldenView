# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models



# =====================================================================
# asset_management app:



class Asset(models.Model):
    idasset = models.AutoField(db_column='IdAsset', primary_key=True)  # Field name made lowercase.
    tickersymbol = models.CharField(db_column='TickerSymbol', max_length=16)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.asset_management'
        app_label = 'asset_management'
        managed = True
        db_table = 'asset'



# =====================================================================
# user_management app:


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


# REPLACED by following 2 classes: UserManager, User
# class User(AbstractBaseUser):
#     iduser = models.AutoField(db_column='IdUser', primary_key=True)  # Field name made lowercase.
#     username = models.CharField(db_column='Username', max_length=32)  # Field name made lowercase.
#     password = models.CharField(db_column='Password', max_length=128)  # Field name made lowercase.
#     email = models.CharField(db_column='Email', max_length=64, unique=True)  # Field name made lowercase.
#
#     class Meta:
#         app_label = 'apps.user_management'
#         app_label = 'user_management'
#         managed = True
#         db_table = 'user'


from django.contrib.auth.models import BaseUserManager
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


# replaces: class User(models.Model):
from django.contrib.auth.models import PermissionsMixin, AbstractUser
class User(AbstractUser, PermissionsMixin):
    iduser = models.AutoField(db_column='IdUser', primary_key=True)
    username = models.CharField(db_column='Username', max_length=32, unique=True)
    password = models.CharField(db_column='Password', max_length=128)
    email = models.CharField(db_column='Email', max_length=64, unique=True)

    objects = UserManager()

    USERNAME_FIELD = 'username'
    EMAIL_FIELD = 'email'
    REQUIRED_FIELDS = ['email']

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = True
        db_table = 'user'



class Administrator(models.Model):
    idadministrator = models.OneToOneField('User', models.CASCADE, db_column='IdUser', primary_key=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = True
        db_table = 'administrator'


from datetime import datetime
from django.utils import timezone
class Trader(models.Model):
    idtrader = models.OneToOneField('User', models.CASCADE, db_column='IdUser', primary_key=True)  # Field name made lowercase.
    birthday = models.DateField(db_column='Birthday', blank=True)  # Field name made lowercase.
    sex = models.CharField(db_column='Sex', max_length=6, blank=True)  # Field name made lowercase.
    idcountry = models.ForeignKey(Country, models.DO_NOTHING, db_column='IdCountry')  # Field name made lowercase.
    termsacceptancetime = models.DateTimeField(db_column='TermsAcceptanceTime', default=timezone.make_aware(datetime(1, 1, 1)))  # Field name made lowercase.
    idselectedfundstransfermethod = models.ForeignKey(FundsTransferMethod, models.DO_NOTHING, db_column='IdSelectedFundsTransferMethod', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = True
        db_table = 'trader'


class Broker(models.Model):
    idbroker = models.OneToOneField('Trader', models.CASCADE, db_column='IdUser', primary_key=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = True
        db_table = 'broker'


class BasicUser(models.Model):
    idbasicuser = models.OneToOneField('Trader', models.CASCADE, db_column='IdUser', primary_key=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = True
        db_table = 'basicuser'



# =====================================================================
# perhaps password_change app



# `didexpire` bool or int for status?; set default ?
class PasswordChangeRequest(models.Model):
    idpcr = models.AutoField(db_column='IdPCR', primary_key=True)  # Field name made lowercase.
    iduser = models.ForeignKey('User', models.DO_NOTHING, db_column='IdUser')  # Field name made lowercase.
    confirmationcode = models.SmallIntegerField(db_column='ConfirmationCode')  # Field name made lowercase.
    creationtime = models.DateTimeField(db_column='CreationTime')  # Field name made lowercase.
    expirationtime = models.DateTimeField(db_column='ExpirationTime')  # Field name made lowercase.
    didexpire = models.IntegerField(db_column='DidExpire')  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'passwordchangerequest'


# =====================================================================
# dependant block - depends on some stuff above


# MUST BE CHANGED idtraderequest TO HAVE AUTO_INCREMENT and TO USE BIGINT - 64bits
# SET DEFAULT VALUE FOR `totaltransactionsprice`
class ActiveTradeRequest(models.Model):
    idtraderequest = models.BigIntegerField(db_column='IdTradeRequest', primary_key=True)  # Field name made lowercase.
    idasset = models.ForeignKey('Asset', models.DO_NOTHING, db_column='IdAsset')  # Field name made lowercase.
    iduser = models.ForeignKey('Trader', models.DO_NOTHING, db_column='IdUser')  # Field name made lowercase.
    quantityrequested = models.IntegerField(db_column='QuantityRequested')  # Field name made lowercase.
    totaltransactionsprice = models.DecimalField(db_column='TotalTransactionsPrice', max_digits=10, decimal_places=2)  # Field name made lowercase.
    quantityrequired = models.IntegerField(db_column='QuantityRequired')  # Field name made lowercase.
    unitpricelowerbound = models.DecimalField(db_column='UnitPriceLowerBound', max_digits=10, decimal_places=2)  # Field name made lowercase.
    unitpriceupperbound = models.DecimalField(db_column='UnitPriceUpperBound', max_digits=10, decimal_places=2)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'activetraderequest'


class PurchaseRequest(models.Model):
    idtraderequest = models.OneToOneField(ActiveTradeRequest, models.CASCADE, db_column='IdTradeRequest', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'purchaserequest'


class SalesRequest(models.Model):
    idtraderequest = models.OneToOneField(ActiveTradeRequest, models.CASCADE, db_column='IdTradeRequest', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'salesrequest'


# =====================================================================
# dependant block - depends on some stuff above


class TextFile(models.Model):
    filepath = models.CharField(db_column='FilePath', primary_key=True, max_length=128)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'textfile'


class BrokerRequestFile(models.Model):
    # DO NOT MAKE CASCADE - never delete broker requests, good data :)
    filepath = models.OneToOneField('TextFile', models.DO_NOTHING, db_column='FilePath', primary_key=True)  # Field name made lowercase.
    requestcontent = models.CharField(db_column='RequestContent', max_length=256, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'brokerrequestfile'


class ApprovalReportFile(models.Model):
    filepath = models.OneToOneField('TextFile', models.CASCADE, db_column='FilePath', primary_key=True)  # Field name made lowercase.
    approvalcontent = models.CharField(db_column='ApprovalContent', max_length=256, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'approvalreportfile'


# ADD default value to status
class BrokerRequest(models.Model):
    idbasicuser = models.OneToOneField(BasicUser, models.DO_NOTHING, db_column='IdBasicUser', primary_key=True)  # Field name made lowercase.
    requestfilepath = models.ForeignKey('BrokerRequestFile', models.DO_NOTHING, db_column='RequestFilePath')  # Field name made lowercase.
    approvalfilepath = models.ForeignKey(ApprovalReportFile, models.DO_NOTHING, db_column='ApprovalFilePath')  # Field name made lowercase.
    idadministrator = models.ForeignKey(Administrator, models.DO_NOTHING, db_column='IdAdministrator')  # Field name made lowercase.
    status = models.CharField(db_column='Status', max_length=16)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'brokerrequest'



# =====================================================================
# dependant block - depends on some stuff above


class BrokerBasicUserContractFile(models.Model):
    # DO NOT MAKE CASCADE - never delete contracts, good data :)
    filepath = models.OneToOneField('TextFile', models.DO_NOTHING, db_column='FilePath', primary_key=True)  # Field name made lowercase.
    contractcontent = models.CharField(db_column='ContractContent', max_length=256, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'brokerbasicusercontractfile'


# `wasaccepted`` bool or int for status ? set default value ?
# DO NOT MAKE CASCADE - never delete contracts, good data :)
# `responsetime` avoid null with some dummy default value ?
# `expirationtime` avoid null with some dummy default value ?
class BrokerBasicUserContract(models.Model):
    idcontract = models.AutoField(db_column='IdContract', primary_key=True)  # Field name made lowercase.
    idbasicuser = models.ForeignKey(BasicUser, models.DO_NOTHING, db_column='IdBasicUser')  # Field name made lowercase.
    idbroker = models.ForeignKey(Broker, models.DO_NOTHING, db_column='IdBroker')  # Field name made lowercase.
    contractfilepath = models.ForeignKey('BrokerBasicUserContractFile', models.DO_NOTHING, db_column='ContractFilePath')  # Field name made lowercase.
    creationtime = models.DateTimeField(db_column='CreationTime')  # Field name made lowercase.
    responsetime = models.DateTimeField(db_column='ResponseTime', blank=True, null=True)  # Field name made lowercase.
    wasaccepted = models.IntegerField(db_column='WasAccepted')  # Field name made lowercase.
    feepercentage = models.FloatField(db_column='FeePercentage')  # Field name made lowercase.
    expirationtime = models.DateTimeField(db_column='ExpirationTime', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'brokerbasicusercontract'


class IsBindedByContract(models.Model):
    # MUST BE CASCADE - as deleted active trade request get stored in nosql and this data with it
    idtraderequest = models.OneToOneField(ActiveTradeRequest, models.CASCADE, db_column='IdTradeRequest', primary_key=True)  # Field name made lowercase.
    idcontract = models.ForeignKey(BrokerBasicUserContract, models.DO_NOTHING, db_column='IdContract')  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'isbindedbycontract'
