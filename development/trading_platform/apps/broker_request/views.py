import logging
from django.http import HttpRequest
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required

from django.contrib.auth.hashers import check_password, make_password

from ..broker_request.backend.src.views.forms import BrokerRequestForm

from ..user_management.models import User


def rendering(request, form, errmsg):
    return render(
        request,
        'broker_request.html',
        {"form": form,"errmsg":errmsg}
    )

@login_required(login_url='login')
def broker_request(request: HttpRequest):
    form = BrokerRequestForm()
    return rendering(request,form,"")

@login_required(login_url='login')
def broker_request_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        form = BrokerRequestForm(request.POST)
        if(form.is_valid()):
            messageform = form.cleaned_data['message']
            #supportrequest = BrokerReqeustForm(name=nameform, email=emailform, time=date.today(), msg=messageform)
            #supportrequest.save()
            
            

        else:
            wrongmsg=""
            if(form.data['message']==""): wrongmsg="you can't leave this field empty"

            return rendering(request, form, wrongmsg)
        pass


    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return redirect('broker_request')

    return redirect('home')
