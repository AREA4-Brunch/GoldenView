from datetime import date
import logging
from django.http import HttpRequest, HttpResponse
from django.shortcuts import render, redirect

from ..website.models import SupportRequest

from ..contact_page.backend.src.views.forms import ContactSupportForm

def rendering(request, form, name, email, msg):
    return render(
        request,
        'contact_page_page.html',
        {"form": form,"errname":name,"erremail":email,"errmsg":msg}
    )

def contact_page(request: HttpRequest):
    
    form = ContactSupportForm()

    return rendering(request,form,"","","")

def form_contact_page(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:

        form = ContactSupportForm(request.POST)
        if(form.is_valid()):
            nameform = form.cleaned_data['name']
            emailform = form.cleaned_data['email']
            messageform = form.cleaned_data['message']
            print(nameform, emailform, date.today(), messageform)
            supportrequest = SupportRequest(name=nameform, email=emailform, time=date.today(), msg=messageform)
            supportrequest.save()
        else:
            #TODO: eventualno da se ulepsa tekst sa nepravilno unetim poljima
            wrongname=""
            wrongemail=""
            wrongmsg=""
            if(form.data['name']==""): wrongname="you can't leave this field empty"
            if(form.data['email']==""): wrongemail="you can't leave this field empty"
            if(form.data['message']==""): wrongmsg="you can't leave this field empty"

            return rendering(request, form, wrongname,wrongemail,wrongmsg)
        pass

    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return redirect('contact_page_page')

    return redirect('home')