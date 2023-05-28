from django.db import models

# Create your models here.


class Asset(models.Model):
    idasset = models.AutoField(db_column='IdAsset', primary_key=True)  # Field name made lowercase.
    tickersymbol = models.CharField(db_column='TickerSymbol', max_length=16)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.asset_management'
        app_label = 'asset_management'
        managed = True
        db_table = 'asset'
