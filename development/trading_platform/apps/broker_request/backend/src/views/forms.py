from django.forms import forms
from django.forms import CharField

class BrokerRequestForm(forms.Form):
    message = CharField(label="message",max_length=2048)
