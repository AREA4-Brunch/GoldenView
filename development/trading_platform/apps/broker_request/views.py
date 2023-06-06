import logging
from django.http import HttpRequest
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required

from django.contrib.auth.hashers import check_password, make_password

from ..user_management.backend.src.utils.user_type import cast_to_trader, cast_to_broker

from ..file_management.models import BrokerRequestFile, TextFile

from ..broker_request.backend.src.views.forms import BrokerRequestForm

def rendering(request, form, errmsg):
    return render(
        request,
        'broker_request.html',
        {"form": form,"errmsg":errmsg}
    )

@login_required(login_url='login')
def broker_request(request: HttpRequest):
    #cast_to_trader(request.user) is None and
    if  cast_to_broker(request.user) is None:
        form = BrokerRequestForm()
        return rendering(request,form,"")
    return redirect("home")

@login_required(login_url='login')
def broker_request_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        form = BrokerRequestForm(request.POST)
        if(form.is_valid()):
            messageform = form.cleaned_data['message']
            fp = "broker_request/file/" + request.user.username
            x = TextFile.objects.filter(filepath = fp).values()
    
            if len(x) > 0:
                wrongmsg="You already sent request."
                return rendering(request, form, wrongmsg)
            
            textfile = TextFile(filepath = fp)
            textfile.save()
            broker = BrokerRequestFile(filepath = textfile, requestcontent = messageform)
            broker.save()
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
