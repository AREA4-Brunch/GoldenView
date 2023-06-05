from django.db import models

from mongoengine import fields, Document, EmbeddedDocument, EmbeddedDocumentField


# Create your models here.


# ======================================
# SQL entities:



class Asset(models.Model):
    idasset = models.AutoField(db_column='IdAsset', primary_key=True)  # Field name made lowercase.
    tickersymbol = models.CharField(db_column='TickerSymbol', max_length=16)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.asset_management'
        app_label = 'asset_management'
        managed = True
        db_table = 'asset'


# move unitpricelowerbound and unitpriceupperbound
# into PurchaseRequest and SalesRequest so the indexes
# could be raised over them for O(m+n) match all requests ??
# raise an index over idasset it for quicker search ??
class ActiveTradeRequest(models.Model):
    idtraderequest = models.BigAutoField(db_column='IdTradeRequest', primary_key=True)  # Field name made lowercase.
    idasset = models.ForeignKey('Asset', models.DO_NOTHING, db_column='IdAsset', null=False, blank=False)  # Field name made lowercase.
    iduser = models.ForeignKey('user_management.Trader', models.CASCADE, db_column='IdUser', null=False, blank=False)  # Field name made lowercase.
    quantityrequested = models.IntegerField(db_column='QuantityRequested', null=False, blank=False)  # Field name made lowercase.
    totaltransactionsprice = models.DecimalField(db_column='TotalTransactionsPrice', max_digits=10, decimal_places=2, null=False, default=0.)  # Field name made lowercase.
    quantityrequired = models.IntegerField(db_column='QuantityRequired', null=False, blank=False)  # Field name made lowercase.
    # unitpricelowerbound = models.DecimalField(db_column='UnitPriceLowerBound', max_digits=10, decimal_places=2, null=False, blank=False)  # Field name made lowercase.
    # unitpriceupperbound = models.DecimalField(db_column='UnitPriceUpperBound', max_digits=10, decimal_places=2, null=False, blank=False)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'activetraderequest'


class PurchaseRequest(models.Model):
    idpurchaserequest = models.OneToOneField(ActiveTradeRequest, models.CASCADE, db_column='IdTradeRequest', primary_key=True)  # Field name made lowercase.
    unitpricelowerbound = models.DecimalField(db_column='UnitPriceLowerBound', max_digits=10, decimal_places=2, null=False, blank=False)  # Field name made lowercase.
    unitpriceupperbound = models.DecimalField(db_column='UnitPriceUpperBound', max_digits=10, decimal_places=2, null=False, blank=False)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'purchaserequest'


class SalesRequest(models.Model):
    idsalesrequest = models.OneToOneField(ActiveTradeRequest, models.CASCADE, db_column='IdTradeRequest', primary_key=True)  # Field name made lowercase.
    unitpricelowerbound = models.DecimalField(db_column='UnitPriceLowerBound', max_digits=10, decimal_places=2, null=False, blank=False)  # Field name made lowercase.
    unitpriceupperbound = models.DecimalField(db_column='UnitPriceUpperBound', max_digits=10, decimal_places=2, null=False, blank=False)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'salesrequest'



# ======================================
# NoSQL entities:



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


class CarriedOutTradeRequest(Document):
    class Contract(EmbeddedDocument):
        _id = fields.IntField(required=True)
        time = fields.DateTimeField(required=True)
        status = fields.StringField(required=True)
        fee_paid = fields.FloatField(precision=2)

    id_trade_request = fields.LongField(primary_key=True)
    is_purchase = fields.BooleanField(required=True)
    id_user = fields.IntField(required=True)
    id_asset = fields.IntField(required=True)
    quantity = fields.IntField(required=True)
    total_price = fields.FloatField(precision=2, required=True)
    contract = EmbeddedDocumentField('CarriedOutTradeRequest.Contract')

    meta = {
        # set the table name to match documentation
        'collection': 'carried_out_trade_request'
    }
