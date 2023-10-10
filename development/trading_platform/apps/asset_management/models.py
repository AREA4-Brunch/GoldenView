# Aleksandar Radenkovic 2020/0272
from django.db import models

from mongoengine import fields, Document, EmbeddedDocument, EmbeddedDocumentField


# Create your models here.


# ======================================
# SQL entities:


# model of the Asset in the database
class Asset(models.Model):
    idasset = models.AutoField(db_column='IdAsset', primary_key=True)  # Field name made lowercase.
    tickersymbol = models.CharField(db_column='TickerSymbol', max_length=16, unique=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.asset_management'
        app_label = 'asset_management'
        managed = True
        db_table = 'asset'

# raise an index over unitpricelowerbound, unitpriceupperbound ??
# raise an index over idasset it for quicker search ??
# model of the purchase request in the database
class PurchaseRequest(models.Model):
    idpurchaserequest = models.BigAutoField(db_column='IdTradeRequest', primary_key=True)  # Field name made lowercase.
    idasset = models.ForeignKey('asset_management.Asset', models.DO_NOTHING, db_column='IdAsset', null=False, blank=False)  # Field name made lowercase.
    iduser = models.ForeignKey('user_management.Trader', models.CASCADE, db_column='IdUser', null=False, blank=False)  # Field name made lowercase.
    quantityrequested = models.IntegerField(db_column='QuantityRequested', null=False, blank=False)  # Field name made lowercase.
    totaltransactionsprice = models.DecimalField(db_column='TotalTransactionsPrice', max_digits=10, decimal_places=2, null=False, default=0.)  # Field name made lowercase.
    quantityrequired = models.IntegerField(db_column='QuantityRequired', null=False, blank=False)  # Field name made lowercase.
    unitpricelowerbound = models.DecimalField(db_column='UnitPriceLowerBound', max_digits=10, decimal_places=4, null=False, blank=False)  # Field name made lowercase.
    unitpriceupperbound = models.DecimalField(db_column='UnitPriceUpperBound', max_digits=10, decimal_places=4, null=False, blank=False)  # Field name made lowercase.
    isboundbycontract = models.BooleanField(db_column='IsBoundByContract', default=False)
    idcontract = models.ForeignKey('broker_management.BrokerBasicUserContract', models.DO_NOTHING, db_column='IdContract', null=True, blank=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.asset_management'
        app_label = 'asset_management'
        managed = True
        db_table = 'purchaserequest'

# raise an index over unitpricelowerbound, unitpriceupperbound ??
# raise an index over idasset it for quicker search ??
# model of the sales request in the database
class SalesRequest(models.Model):
    idsalesrequest = models.BigAutoField(db_column='IdTradeRequest', primary_key=True)  # Field name made lowercase.
    idasset = models.ForeignKey('asset_management.Asset', models.DO_NOTHING, db_column='IdAsset', null=False, blank=False)  # Field name made lowercase.
    iduser = models.ForeignKey('user_management.Trader', models.CASCADE, db_column='IdUser', null=False, blank=False)  # Field name made lowercase.
    quantityrequested = models.IntegerField(db_column='QuantityRequested', null=False, blank=False)  # Field name made lowercase.
    totaltransactionsprice = models.DecimalField(db_column='TotalTransactionsPrice', max_digits=10, decimal_places=2, null=False, default=0.)  # Field name made lowercase.
    quantityrequired = models.IntegerField(db_column='QuantityRequired', null=False, blank=False)  # Field name made lowercase.
    unitpricelowerbound = models.DecimalField(db_column='UnitPriceLowerBound', max_digits=10, decimal_places=4, null=False, blank=False)  # Field name made lowercase.
    unitpriceupperbound = models.DecimalField(db_column='UnitPriceUpperBound', max_digits=10, decimal_places=4, null=False, blank=False)  # Field name made lowercase.
    isboundbycontract = models.BooleanField(db_column='IsBoundByContract', default=False)
    idcontract = models.ForeignKey('broker_management.BrokerBasicUserContract', models.DO_NOTHING, db_column='IdContract', null=True, blank=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.asset_management'
        app_label = 'asset_management'
        managed = True
        db_table = 'salesrequest'



# ======================================
# NoSQL entities:


# model of the transaction in the database
class AssetTransaction(Document):
    id_trade_request_purchase = fields.LongField()
    id_trade_request_sale = fields.LongField()
    quantity = fields.IntField(required=True)
    unit_price = fields.FloatField(precision=2, required=True)
    time = fields.DateTimeField(required=True)

    meta = {
        # set the table name to match documentation
        'collection': 'asset_transaction'
    }

# model of the stats in the database
class AssetStats(Document):
    class DailyPredictions(EmbeddedDocument):
        start_day = fields.DateField(required=True)
        pred_vals = fields.ListField(fields.FloatField(precision=2), required=True)

    asset_id = fields.IntField(primary_key=True)
    daily_predictions = EmbeddedDocumentField('AssetStats.DailyPredictions')

    meta = {
        # set the table name to match documentation
        'collection': 'asset_stats'
    }

# model of the carried out requests in the database
class CarriedOutPurchaseTradeRequest(Document):
    class Contract(EmbeddedDocument):
        id = fields.IntField(primary_key=True)
        time = fields.DateTimeField(required=True)
        status = fields.StringField(required=True)
        fee_paid = fields.FloatField(precision=2)

    id_trade_request = fields.LongField(primary_key=True)
    id_user = fields.IntField(required=True)
    id_asset = fields.IntField(required=True)
    quantity = fields.IntField(required=True)
    total_price = fields.FloatField(precision=2, required=True)
    contract = EmbeddedDocumentField('CarriedOutPurchaseTradeRequest.Contract')

    meta = {
        # set the table name to match documentation
        'collection': 'carried_out_purchase_trade_request'
    }

class CarriedOutSalesTradeRequest(Document):
    class Contract(EmbeddedDocument):
        id = fields.IntField(primary_key=True)
        time = fields.DateTimeField(required=True)
        status = fields.StringField(required=True)
        fee_paid = fields.FloatField(precision=2)

    id_trade_request = fields.LongField(primary_key=True)
    id_user = fields.IntField(required=True)
    id_asset = fields.IntField(required=True)
    quantity = fields.IntField(required=True)
    total_price = fields.FloatField(precision=2, required=True)
    contract = EmbeddedDocumentField('CarriedOutSalesTradeRequest.Contract')

    meta = {
        # set the table name to match documentation
        'collection': 'carried_out_sales_trade_request'
    }
