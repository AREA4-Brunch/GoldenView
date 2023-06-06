from django.db import models

# Create your models here.


class TextFile(models.Model):
    filepath = models.CharField(db_column='FilePath', primary_key=True, max_length=128)  # Field name made lowercase.

    def deleteRow(self):
        self.delete()

    class Meta:
        app_label = 'file_management'
        managed = True
        db_table = 'textfile'


class BrokerRequestFile(models.Model):
    filepath = models.OneToOneField('TextFile', models.DO_NOTHING, db_column='FilePath', primary_key=True)  # Field name made lowercase.
    requestcontent = models.CharField(db_column='RequestContent', max_length=256, blank=True, null=True)  # Field name made lowercase.

    def __str__(self) -> str:
        return ""

    def deleteRow(self):
        self.delete()

    class Meta:
        app_label = 'file_management'
        managed = True
        db_table = 'brokerrequestfile'


class ApprovalReportFile(models.Model):
    filepath = models.OneToOneField('TextFile', models.CASCADE, db_column='FilePath', primary_key=True)  # Field name made lowercase.
    approvalcontent = models.CharField(db_column='ApprovalContent', max_length=256, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        app_label = 'file_management'
        managed = True
        db_table = 'approvalreportfile'


class BrokerBasicUserContractFile(models.Model):
    filepath = models.OneToOneField('TextFile', models.DO_NOTHING, db_column='FilePath', primary_key=True)  # Field name made lowercase.
    contractcontent = models.CharField(db_column='ContractContent', max_length=256, blank=True, null=True)  # Field name made lowercase.

    def __str__(self) -> str:
        return self.contractcontent

    def deleteRow(self):
        self.delete()

    class Meta:
        app_label = 'file_management'
        managed = True
        db_table = 'brokerbasicusercontractfile'
