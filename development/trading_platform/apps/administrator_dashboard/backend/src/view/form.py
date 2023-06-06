from django.forms import forms
from django import forms
from django.forms import CharField

from apps.file_management.models import BrokerRequestFile
from apps.user_management.models import User


class AdministratorDashboardForm(forms.Form):
    choices = forms.ModelMultipleChoiceField(
        queryset = User.objects.all(),
        widget  = forms.CheckboxSelectMultiple,
    )


class AdministratorDashboardRequestForm(forms.Form):
    choices = forms.ModelMultipleChoiceField(
        queryset = BrokerRequestFile.objects.all(),
        widget  = forms.CheckboxSelectMultiple,
    )
