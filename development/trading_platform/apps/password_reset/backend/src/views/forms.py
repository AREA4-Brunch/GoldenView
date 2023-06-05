from django.forms import forms
from django.forms import CharField

class PasswordResetForm(forms.Form):
    old = CharField(label="old",max_length=64)
    new = CharField(label="new",max_length=64)

class Cancel(forms.Form):
    old = CharField(label="old",max_length=64)
    new = CharField(label="new",max_length=64)