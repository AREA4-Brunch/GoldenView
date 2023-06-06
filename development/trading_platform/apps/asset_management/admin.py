from django.contrib import admin

# Register your models here.
from .models import Asset, MakeBeliefOwns, ActiveTradeRequest, \
                    PurchaseRequest, SalesRequest

admin.site.register(Asset)
admin.site.register(MakeBeliefOwns)
admin.site.register(ActiveTradeRequest)
admin.site.register(PurchaseRequest)
admin.site.register(SalesRequest)
