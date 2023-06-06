from django.contrib import admin

from ..asset_management.models import MakeBeliefOwns

# Register your models here.

from .models import User, Broker, BasicUser, Country, FundsTransferMethod, Trader

admin.site.register(User)
admin.site.register(Broker)
admin.site.register(BasicUser)
admin.site.register(Country)
admin.site.register(FundsTransferMethod)
admin.site.register(Trader)
