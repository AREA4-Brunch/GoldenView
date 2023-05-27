# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class ActiveTradeRequest(models.Model):
    quantityrequested = models.IntegerField(db_column='QuantityRequested')  # Field name made lowercase.
    totaltransactionsprice = models.DecimalField(db_column='TotalTransactionsPrice', max_digits=10, decimal_places=2)  # Field name made lowercase.
    idasset = models.ForeignKey('Asset', models.DO_NOTHING, db_column='IdAsset')  # Field name made lowercase.
    idtraderequest = models.BigIntegerField(db_column='IdTradeRequest', primary_key=True)  # Field name made lowercase.
    iduser = models.ForeignKey('Trader', models.DO_NOTHING, db_column='IdUser')  # Field name made lowercase.
    quantityrequired = models.IntegerField(db_column='QuantityRequired')  # Field name made lowercase.
    unitpricelowerbound = models.DecimalField(db_column='UnitPriceLowerBound', max_digits=10, decimal_places=2)  # Field name made lowercase.
    unitpriceupperbound = models.DecimalField(db_column='UnitPriceUpperBound', max_digits=10, decimal_places=2)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'activetraderequest'


class Administrator(models.Model):
    iduser = models.OneToOneField('User', models.DO_NOTHING, db_column='IdUser', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'administrator'


class ApprovalReportFile(models.Model):
    approvalcontent = models.CharField(db_column='ApprovalContent', max_length=256, blank=True, null=True)  # Field name made lowercase.
    filepath = models.OneToOneField('TextFile', models.DO_NOTHING, db_column='FilePath', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'approvalreportfile'


class Asset(models.Model):
    idasset = models.IntegerField(db_column='IdAsset', primary_key=True)  # Field name made lowercase.
    tickersymbol = models.CharField(db_column='TickerSymbol', max_length=16)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'asset'


class BasicUser(models.Model):
    iduser = models.OneToOneField('Trader', models.DO_NOTHING, db_column='IdUser', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'basicuser'


class Broker(models.Model):
    iduser = models.OneToOneField('Trader', models.DO_NOTHING, db_column='IdUser', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'broker'


class BrokerBasicUserContract(models.Model):
    idcontract = models.IntegerField(db_column='IdContract', primary_key=True)  # Field name made lowercase.
    idbasicuser = models.ForeignKey(BasicUser, models.DO_NOTHING, db_column='IdBasicUser')  # Field name made lowercase.
    idbroker = models.ForeignKey(Broker, models.DO_NOTHING, db_column='IdBroker')  # Field name made lowercase.
    creationtime = models.DateTimeField(db_column='CreationTime')  # Field name made lowercase.
    responsetime = models.DateTimeField(db_column='ResponseTime', blank=True, null=True)  # Field name made lowercase.
    wasaccepted = models.IntegerField(db_column='WasAccepted')  # Field name made lowercase.
    feepercentage = models.FloatField(db_column='FeePercentage')  # Field name made lowercase.
    expirationtime = models.DateTimeField(db_column='ExpirationTime', blank=True, null=True)  # Field name made lowercase.
    contractfilepath = models.ForeignKey('BrokerBasicUserContractFile', models.DO_NOTHING, db_column='ContractFilePath')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'brokerbasicusercontract'


class BrokerBasicUserContractFile(models.Model):
    contractcontent = models.CharField(db_column='ContractContent', max_length=256, blank=True, null=True)  # Field name made lowercase.
    filepath = models.OneToOneField('TextFile', models.DO_NOTHING, db_column='FilePath', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'brokerbasicusercontractfile'


class BrokerRequest(models.Model):
    idbasicuser = models.OneToOneField(BasicUser, models.DO_NOTHING, db_column='IdBasicUser', primary_key=True)  # Field name made lowercase.
    status = models.CharField(db_column='Status', max_length=16)  # Field name made lowercase.
    idadministrator = models.ForeignKey(Administrator, models.DO_NOTHING, db_column='IdAdministrator')  # Field name made lowercase.
    requestfilepath = models.ForeignKey('BrokerRequestFile', models.DO_NOTHING, db_column='RequestFilePath')  # Field name made lowercase.
    approvalfilepath = models.ForeignKey(ApprovalReportFile, models.DO_NOTHING, db_column='ApprovalFilePath')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'brokerrequest'


class BrokerRequestFile(models.Model):
    filepath = models.OneToOneField('TextFile', models.DO_NOTHING, db_column='FilePath', primary_key=True)  # Field name made lowercase.
    requestcontent = models.CharField(db_column='RequestContent', max_length=256, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'brokerrequestfile'


class Country(models.Model):
    idcountry = models.IntegerField(db_column='IdCountry', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=32)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'country'


class FundsTransferMethod(models.Model):
    idpaymentmethod = models.IntegerField(db_column='IdPaymentMethod', primary_key=True)  # Field name made lowercase.
    accesskey = models.CharField(db_column='AccessKey', max_length=64)  # Field name made lowercase.
    makebeliefbalance = models.DecimalField(db_column='MakeBeliefBalance', max_digits=10, decimal_places=2, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'fundstransfermethod'


class IsBindedByContract(models.Model):
    idtraderequest = models.OneToOneField(ActiveTradeRequest, models.DO_NOTHING, db_column='IdTradeRequest', primary_key=True)  # Field name made lowercase.
    idcontract = models.ForeignKey(BrokerBasicUserContract, models.DO_NOTHING, db_column='IdContract')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'isbindedbycontract'


class MakeBeliefOwns(models.Model):
    idpaymentmethod = models.OneToOneField(FundsTransferMethod, models.DO_NOTHING, db_column='IdPaymentMethod', primary_key=True)  # Field name made lowercase. The composite primary key (IdPaymentMethod, IdAsset) found, that is not supported. The first column is selected.
    idasset = models.ForeignKey(Asset, models.DO_NOTHING, db_column='IdAsset')  # Field name made lowercase.
    quantity = models.IntegerField(db_column='Quantity')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'makebeliefowns'
        unique_together = (('idpaymentmethod', 'idasset'),)


class PasswordChangeRequest(models.Model):
    iduser = models.ForeignKey('User', models.DO_NOTHING, db_column='IdUser')  # Field name made lowercase.
    idpcr = models.IntegerField(db_column='IdPCR', primary_key=True)  # Field name made lowercase.
    confirmationcode = models.SmallIntegerField(db_column='ConfirmationCode')  # Field name made lowercase.
    creationtime = models.DateTimeField(db_column='CreationTime')  # Field name made lowercase.
    expirationtime = models.DateTimeField(db_column='ExpirationTime')  # Field name made lowercase.
    didexpire = models.IntegerField(db_column='DidExpire')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'passwordchangerequest'


class PurchaseRequest(models.Model):
    idtraderequest = models.OneToOneField(ActiveTradeRequest, models.DO_NOTHING, db_column='IdTradeRequest', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'purchaserequest'


class SalesRequest(models.Model):
    idtraderequest = models.OneToOneField(ActiveTradeRequest, models.DO_NOTHING, db_column='IdTradeRequest', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'salesrequest'


class TextFile(models.Model):
    filepath = models.CharField(db_column='FilePath', primary_key=True, max_length=128)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'textfile'


class Trader(models.Model):
    iduser = models.OneToOneField('User', models.DO_NOTHING, db_column='IdUser', primary_key=True)  # Field name made lowercase.
    birthday = models.DateTimeField(db_column='Birthday', blank=True, null=True)  # Field name made lowercase.
    sex = models.CharField(db_column='Sex', max_length=6, blank=True, null=True)  # Field name made lowercase.
    idcountry = models.ForeignKey(Country, models.DO_NOTHING, db_column='IdCountry')  # Field name made lowercase.
    termsacceptancetime = models.DateTimeField(db_column='TermsAcceptanceTime')  # Field name made lowercase.
    idselectedfundstrasnfermethod = models.ForeignKey(FundsTransferMethod, models.DO_NOTHING, db_column='IdSelectedFundsTrasnferMethod', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'trader'


class User(models.Model):
    iduser = models.IntegerField(db_column='IdUser', primary_key=True)  # Field name made lowercase.
    username = models.CharField(db_column='Username', max_length=32)  # Field name made lowercase.
    password = models.CharField(db_column='Password', max_length=32)  # Field name made lowercase.
    email = models.CharField(db_column='Email', max_length=64)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'user'
