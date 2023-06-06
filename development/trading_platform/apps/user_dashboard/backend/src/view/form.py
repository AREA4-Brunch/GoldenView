# Jovan Jovanovic 2020/0083
from django.forms import forms
from django import forms
from django.forms import CharField, IntegerField

from apps.file_management.models import BrokerRequestFile
from apps.user_management.models import User


class UserDashboardForm(forms.Form):
   pass


class UserDasboardRequestForm(forms.Form):
   pass