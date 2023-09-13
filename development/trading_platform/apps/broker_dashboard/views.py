# Jovan Jovanovic 2020/0083
from datetime import date
import logging
from django.http import HttpRequest
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required

from ..broker_management.models import BrokerBasicUserContract

from ..broker_dashboard.backend.src.view.form import BrokerDasboardRequestForm, BrokerDashboardForm

# from ..administrator_dashboard.backend.src.view.form import AdministratorDashboardForm, AdministratorDashboardRequestForm
from ..user_management.backend.src.utils.user_type import cast_to_basic, cast_to_broker

from ..file_management.models import BrokerBasicUserContractFile, TextFile
from ..user_management.models import User

from django.utils import timezone
# Create your views here.

# render table
def rendering1(request, users, form):
    return render(
        request,
        'broker_dashboard_page.html',
        {"users": users,"form": form}
    )

# create data for table
def createContext1():
    context = []  
    basicusers = []
    users = User.objects.all()
        
    for user in users:
        if cast_to_basic(user) is not None and cast_to_broker(user) is None:
            context.append("Basic user")
            basicusers.append(user)
         

    ziped = zip(basicusers,context)

    return ziped

# form/table for broker dashboard
@login_required(login_url='login')
def broker_dashboard(request: HttpRequest):
    if cast_to_broker(request.user) is None:
        return redirect('home')
    
    form = BrokerDashboardForm()
    # print(form)
    return rendering1(request, createContext1(),form)

# form/table of the broker dashboard
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
            # print("else")
            return broker_dashboard(request)


    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return broker_dashboard(request)


######################################################################################

# render request for broker
def rendering2(request, user, form, errmsg,errfee, success_msg=None):
    return render(
        request,
        'broker_dashboard_send_request.html',
        {"dst_user": user, "form": form,"errmsg":errmsg,"errfee":errfee,
         "success_msg": success_msg
         }
    )

# form for the broker dashboard request sent
def broker_dashboard_send_request(request: HttpRequest, user):
    
    form = BrokerDasboardRequestForm()
    
    return rendering2(request,user,form,"","")

# form for the broker dashboard request sent
def broker_dashboard_send_request_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        idcontract = None
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
            brokercontract = BrokerBasicUserContractFile(filepath = textfile, contractcontent = messageform)
            brokercontract.save()
            # print(cast_to_basic(user))
            # print(cast_to_broker(request.user))
            # print(brokercontract)
            # print(timezone.now())
            # print(feeform)
            # print(timezone.now() + timezone.timedelta(days=365))
            contract = BrokerBasicUserContract(idbasicuser=cast_to_basic(user),
                                               idbroker=cast_to_broker(request.user),
                                               contractfilepath=brokercontract,
                                               creationtime=timezone.now(),
                                               responsetime=None,
                                               wasaccepted=False,
                                               feepercentage=feeform,
                                               expirationtime=timezone.now() + timezone.timedelta(days=365)
                                               )
            contract.save()
            idcontract = contract.idcontract

        else:
            wrongmsg=""
            if(form.data['message']==""): wrongmsg="you can't leave this field empty"
            wrongfee=""
            if(form.data['fee']==""): wrongfee="you can't leave this field empty"
            return rendering2(request, user ,form, wrongmsg, wrongfee)


    except Exception as e:
        # print("error")
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return broker_dashboard(request)

    return rendering2(
        request, user ,form, '', '',
        success_msg="Request has been successfuly sent. Sit tight until the user responds."
                   + f'Contract ID: {idcontract}'
    )
    # return broker_dashboard(request)

#################################################################

# logout for the user account
def adminlogout(request: HttpRequest):
    return redirect('logout')
