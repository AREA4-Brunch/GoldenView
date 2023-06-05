from django.forms import forms
from django import forms
from django.forms import CharField

from apps.user_management.models import User


class AdministratorDashboardForm(forms.Form):
    choices = forms.ModelMultipleChoiceField(
        queryset = User.objects.all(),
        widget  = forms.CheckboxSelectMultiple,
    )

