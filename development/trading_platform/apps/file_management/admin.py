from django.contrib import admin

# Register your models here.

from .models import TextFile, BrokerRequestFile, \
                    ApprovalReportFile, \
                    BrokerBasicUserContractFile


admin.site.register(TextFile)
admin.site.register(BrokerRequestFile)
admin.site.register(ApprovalReportFile)
admin.site.register(BrokerBasicUserContractFile)
