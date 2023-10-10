# Aleksandar Radenkovic 2020/0272 i Jovan Jovanovic 2020/0083
from django.db import models


# Create your models here.


class Broker(models.Model):
    idbroker = models.OneToOneField('user_management.Trader', models.CASCADE, db_column='IdUser', primary_key=True)  # Field name made lowercase.

    class Meta:
        app_label = 'broker_management'
        managed = True
        db_table = 'broker'


# `responsetime` avoid null with some dummy default value ?
# form for the contract between broker and basic user
class BrokerBasicUserContract(models.Model):
    idcontract = models.AutoField(db_column='IdContract', primary_key=True)  # Field name made lowercase.
    idbasicuser = models.ForeignKey('user_management.BasicUser', models.DO_NOTHING, db_column='IdBasicUser')  # Field name made lowercase.
    idbroker = models.ForeignKey(Broker, models.DO_NOTHING, db_column='IdBroker')  # Field name made lowercase.
    contractfilepath = models.ForeignKey('file_management.BrokerBasicUserContractFile', models.DO_NOTHING, db_column='ContractFilePath')  # Field name made lowercase.
    creationtime = models.DateTimeField(db_column='CreationTime', blank=False, null=False)  # Field name made lowercase.
    responsetime = models.DateTimeField(db_column='ResponseTime', blank=True, null=True)  # Field name made lowercase.
    # wasaccepted: int = status: 0 - was not accepted, 1 - was accepted
    wasaccepted = models.IntegerField(db_column='WasAccepted', null=False, default=0)  # Field name made lowercase.
    feepercentage = models.FloatField(db_column='FeePercentage', null=False, default=0.)  # Field name made lowercase.
    expirationtime = models.DateTimeField(db_column='ExpirationTime', blank=False, null=False)  # Field name made lowercase.

    def deleteRow(self):
        self.delete()

    class Meta:
        app_label = 'broker_management'
        managed = True
        db_table = 'brokerbasicusercontract'
