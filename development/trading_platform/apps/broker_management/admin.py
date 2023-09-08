# Aleksandar Radenkovic 2020/0272 i Jovan Jovanovic 2020/0083
from django.contrib import admin

# Register your models here.

from .models import BrokerBasicUserContract


admin.site.register(BrokerBasicUserContract)
