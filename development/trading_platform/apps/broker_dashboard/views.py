import logging
from django.http import HttpRequest
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required

from ..broker_dashboard.backend.src.view.form import BrokerDasboardRequestForm, BrokerDashboardForm

from ..administrator_dashboard.backend.src.view.form import AdministratorDashboardForm, AdministratorDashboardRequestForm
from ..user_management.backend.src.utils.user_type import cast_to_trader, cast_to_broker

from ..file_management.models import ApprovalReportFile, BrokerBasicUserContractFile, BrokerRequestFile, TextFile
from ..user_management.models import Broker, Trader, User

# Create your views here.

def rendering1(request, users, form):
    return render(
        request,
        'broker_dashboard_page.html',
        {"users": users,"form": form}
    )

def createContext1():
    context = []  
    basicusers = []
    users = User.objects.all()
        
    for user in users:
        if user.is_staff == 1 or cast_to_broker(user) is not None:
            continue
        elif cast_to_trader(user) is not None:
            context.append("Trader")
        else:
            context.append("Basic user")
        basicusers.append(user)
         

    ziped = zip(basicusers,context)

    return ziped

@login_required(login_url='login')
def broker_dashboard(request: HttpRequest):
    if cast_to_broker(request.user) is None:
        return redirect('home')
    
    form = BrokerDashboardForm()
    print(form)
    return rendering1(request, createContext1(),form)

@login_required(login_url='login')
def broker_dashboard_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        form = BrokerDashboardForm(request.POST)
        if(form.is_valid()):
            user=""
            for i in User.objects.all():
                if i.username in request.POST:
                    user=i
                    break
            
            return broker_dashboard_send_request(request,user)
            
        else:
            print("else")
            return broker_dashboard(request)


    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return broker_dashboard(request)


######################################################################################

def rendering2(request, user, form, errmsg,errfee):
    return render(
        request,
        'broker_dashboard_send_request.html',
        {"user": user, "form": form,"errmsg":errmsg,"errfee":errfee}
    )


def broker_dashboard_send_request(request: HttpRequest, user):
    
    form = BrokerDasboardRequestForm()
    
    return rendering2(request,user,form,"","")


def broker_dashboard_send_request_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        form = BrokerDasboardRequestForm(request.POST)
        user=""
        for i in User.objects.all():
            if i.username in request.POST:
                user=i
                break
        if(form.is_valid()):
            
            messageform = form.cleaned_data['message']
            feeform = form.cleaned_data['fee']
            
            fp = "broker_basicuser_contract/file/" + request.user.username + "/" + user.username
            
            x = TextFile.objects.filter(filepath = fp).values()
    
            if len(x) > 0:
                wrongmsg="You already sent request."
                return rendering2(request, user ,form, wrongmsg, "")
            
            textfile = TextFile(filepath = fp)
            textfile.save()
            msg = messageform+"\n fee:"+str(feeform)+"$"
            broker = BrokerBasicUserContractFile(filepath = textfile, contractcontent = msg)
            broker.save()

        else:
            wrongmsg=""
            if(form.data['message']==""): wrongmsg="you can't leave this field empty"
            wrongfee=""
            if(form.data['fee']==""): wrongfee="you can't leave this field empty"
            return rendering2(request, user ,form, wrongmsg, wrongfee)


    except Exception as e:
        print("error")
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return broker_dashboard(request)

    return broker_dashboard(request)

#################################################################

def adminlogout(request: HttpRequest):
    return redirect('logout')