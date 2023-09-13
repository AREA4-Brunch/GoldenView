from django.db import models

# Create your models here.



# raise index over idasset ??
class MakeBeliefOwns(models.Model):
    # idpaymentmethod = models.OneToOneField('wallet.FundsTransferMethod', models.DO_NOTHING, db_column='IdPaymentMethod', primary_key=True)  # Field name made lowercase. The composite primary key (IdPaymentMethod, IdAsset) found, that is not supported. The first column is selected.
    idpaymentmethod = models.ForeignKey('user_management.FundsTransferMethod', models.DO_NOTHING, db_column='IdPaymentMethod', null=False, blank=False)
    idasset = models.ForeignKey('asset_management.Asset', models.DO_NOTHING, db_column='IdAsset', null=False, blank=False)  # Field name made lowercase.
    quantity = models.IntegerField(db_column='Quantity', default=0)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.wallet'
        app_label = 'wallet'
        managed = True
        db_table = 'makebeliefowns'
        # unique_together = (('idpaymentmethod', 'idasset'),)
        constraints = [
            models.UniqueConstraint(fields=['idpaymentmethod', 'idasset'],
                                    name='composite_primary_key')
        ]
