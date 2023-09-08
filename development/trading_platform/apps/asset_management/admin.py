# Aleksandar Radenkovic 2020/0272
from django.contrib import admin

# Register your models here.
from .models import Asset, MakeBeliefOwns, \
                    PurchaseRequest, SalesRequest

admin.site.register(Asset)
admin.site.register(MakeBeliefOwns)
admin.site.register(PurchaseRequest)
admin.site.register(SalesRequest)
