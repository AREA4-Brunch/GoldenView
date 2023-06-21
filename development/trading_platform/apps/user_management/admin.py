# Aleksandar Radenkovic 2020/0272
from django.contrib import admin
from django.contrib.auth.models import Permission


# Register your models here.

from .models import User, Broker, BasicUser, Country, \
                    FundsTransferMethod, Trader, \
                    Administrator


admin.site.register(User)
admin.site.register(Administrator)
admin.site.register(Broker)
admin.site.register(BasicUser)
admin.site.register(Trader)
admin.site.register(Country)
admin.site.register(FundsTransferMethod)
admin.site.register(Permission)
