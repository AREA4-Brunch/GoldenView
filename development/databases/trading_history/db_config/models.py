from mongoengine import fields, Document, EmbeddedDocument, EmbeddedDocumentField



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

class SupportRequest(Document):
    class ProcessingInfo(EmbeddedDocument):
        admin_id = fields.IntField(required=True)
        status = fields.StringField(required=True)
        comment = fields.StringField()

    name = fields.StringField(required=True)
    email = fields.EmailField(required=True)
    time = fields.DateTimeField(required=True)
    msg = fields.StringField(required=True)
    processing = EmbeddedDocumentField(ProcessingInfo)
