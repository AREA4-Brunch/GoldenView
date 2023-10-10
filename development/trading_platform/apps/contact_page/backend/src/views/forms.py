# Jovana Bjelica 2020/0349
from django.forms import forms
from django.forms import CharField

class ContactSupportForm(forms.Form):
    name = CharField(label="name",max_length=32)
    email = CharField(label="email",max_length=32)
    message = CharField(label="message",max_length=2048)
