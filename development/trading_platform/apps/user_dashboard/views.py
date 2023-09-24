# Jovan Jovanovic 2020/0083
import logging
from django.http import HttpRequest
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required

from apps.broker_management.models import BrokerBasicUserContract

from ..user_dashboard.backend.src.view.form import UserDasboardRequestForm, UserDashboardForm

from ..user_management.backend.src.utils.user_type import cast_to_trader, cast_to_broker, cast_to_basic

from ..file_management.models import ApprovalReportFile, BrokerBasicUserContractFile, BrokerRequestFile, TextFile
from ..user_management.models import User

from django.utils import timezone

# Create your views here.

# rendering the page
def rendering1(request, contracts, form):
    return render(
        request,
        'user_dashboard_page.html',
        {"contracts": contracts,"form": form}
    )

# request for user dashboard
@login_required(login_url='login')
def user_dashboard(request: HttpRequest):
    if cast_to_basic(request.user) is None \
    or request.user.is_staff:
        return redirect('home')

    form = UserDashboardForm()

    pushedcontracts = []
    bros = []
    contracts = BrokerBasicUserContractFile.objects.all()
        
    for contract in contracts:
        str = contract.filepath.filepath.split('/')[3]
        if(str==request.user.username):
            acceptedcontracts = BrokerBasicUserContract.objects.all()
            flagaccepted=True
            for accepted in acceptedcontracts:
                if(accepted.contractfilepath==contract):
                    if(accepted.wasaccepted==True): flagaccepted=False;break
            
            if flagaccepted==True:
                user = User.objects.get(username=contract.filepath.filepath.split('/')[2])
                bros.append(user)
                pushedcontracts.append(contract)

    return rendering1(request, zip(bros,pushedcontracts), form)

# function for the form on user dashboard page
@login_required(login_url='login')
def user_dashboard_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        form = UserDashboardForm(request.POST)
        if(form.is_valid()):
            path=""
            for i in User.objects.all():
                filepath = "broker_basicuser_contract/file/" + i.username + "/" + request.user.username
                if filepath in request.POST:
                    path=filepath
                    break
            
            contract = BrokerBasicUserContractFile.objects.get(filepath=TextFile(path))
            return user_dashboard_send_request(request,contract)
            
        else:
            print("else")
            return user_dashboard(request)


    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.exception(f'Internal error: {e}')
        return user_dashboard(request)


######################################################################################

# render second form
def rendering2(request, contract, form):
    return render(
        request,
        'user_dashboard_see_request.html',
        {"contract": contract ,"form": form}
    )

# request for the second form
def user_dashboard_send_request(request: HttpRequest, contract):
    
    form = UserDasboardRequestForm()
    return rendering2(request,contract,form)

# function for accepting the request
def user_dashboard_send_request_accept_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        form = UserDasboardRequestForm(request.POST)
        contract=""
        for i in BrokerBasicUserContractFile.objects.all():
            if i.filepath.filepath in request.POST:
                contract=i
                break
        
        
        if(form.is_valid()):
            contractfajl = ""
            contractfajls = BrokerBasicUserContract.objects.all()
            for i in contractfajls:
                if i.contractfilepath==contract:
                    contractfajl=i
            
            contractfajl.wasaccepted=True
            contractfajl.responsetime=timezone.now()
            contractfajl.save()
        else:
            pass


    except Exception as e:
        print("error")
        request.session['internal_err'] = str(e)
        logging.exception(f'Internal error: {e}')
        return user_dashboard(request)

    return user_dashboard(request)

# function for declining the request
def user_dashboard_send_request_decline_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        form = UserDasboardRequestForm(request.POST)
        contract=""
        for i in BrokerBasicUserContractFile.objects.all():
            if i.filepath.filepath in request.POST:
                contract=i
                break

        if(form.is_valid()):
            textfile = contract.filepath
            contractfajls = BrokerBasicUserContract.objects.all()
            for i in contractfajls:
                if i.contractfilepath==contract:
                    i.deleteRow()
            contract.deleteRow()
            textfile.deleteRow()

        else:
            pass


    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.exception(f'Internal error: {e}')
        # return user_dashboard(request)
        return redirect('user_dashboard_page')

    # return user_dashboard(request)
    return redirect('user_dashboard_page')

#################################################################
