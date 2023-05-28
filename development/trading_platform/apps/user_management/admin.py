from django.contrib import admin

# Register your models here.

from .models import User, Broker, BasicUser, Country, MakeBeliefOwns, FundsTransferMethod


admin.site.register(User)
admin.site.register(Broker)
admin.site.register(BasicUser)
admin.site.register(Country)
admin.site.register(MakeBeliefOwns)
admin.site.register(FundsTransferMethod)
