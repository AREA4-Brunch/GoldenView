from django.contrib import admin

# Register your models here.

from .models import BrokerBasicUserContract, IsBindedByContract


admin.site.register(BrokerBasicUserContract)
admin.site.register(IsBindedByContract)
