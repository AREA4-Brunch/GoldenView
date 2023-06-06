# Aleksandar Radenkovic 2020/0272 i Jovan Jovanovic 2020/0083
from django.db import models

from apps.asset_management.models import ActiveTradeRequest
from apps.user_management.models import BasicUser, Broker
from apps.file_management.models import BrokerBasicUserContractFile


# Create your models here.



# `responsetime` avoid null with some dummy default value ?
# form for the contract between broker and basic user
class BrokerBasicUserContract(models.Model):
    idcontract = models.AutoField(db_column='IdContract', primary_key=True)  # Field name made lowercase.
    idbasicuser = models.ForeignKey(BasicUser, models.DO_NOTHING, db_column='IdBasicUser')  # Field name made lowercase.
    idbroker = models.ForeignKey(Broker, models.DO_NOTHING, db_column='IdBroker')  # Field name made lowercase.
    contractfilepath = models.ForeignKey(BrokerBasicUserContractFile, models.DO_NOTHING, db_column='ContractFilePath')  # Field name made lowercase.
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

# check if it is binded by contract
class IsBindedByContract(models.Model):
    # MUST BE CASCADE - as deleted active trade request get stored in nosql and this data with it
    idtraderequest = models.OneToOneField(ActiveTradeRequest, models.CASCADE, db_column='IdTradeRequest', primary_key=True)  # Field name made lowercase.
    idcontract = models.ForeignKey(BrokerBasicUserContract, models.DO_NOTHING, db_column='IdContract')  # Field name made lowercase.

    class Meta:
        app_label = 'broker_management'
        managed = True
        db_table = 'isbindedbycontract'
