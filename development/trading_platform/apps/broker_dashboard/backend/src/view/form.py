# Jovan Jovanovic 2020/0083
from django.forms import forms
from django import forms
from django.forms import CharField, IntegerField

from apps.file_management.models import BrokerRequestFile
from apps.user_management.models import User


class BrokerDashboardForm(forms.Form):
   pass


class BrokerDasboardRequestForm(forms.Form):
   message = CharField(label="message",max_length=2048)
   fee = IntegerField(label="fee")