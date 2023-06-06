import logging
from django.http import HttpRequest
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required

from ..administrator_dashboard.backend.src.view.form import AdministratorDashboardForm, AdministratorDashboardRequestForm
from ..user_management.backend.src.utils.user_type import cast_to_trader, cast_to_broker

from ..file_management.models import ApprovalReportFile, BrokerRequestFile, TextFile
from ..user_management.models import Broker, Trader, User

# Create your views here.

def rendering1(request, users, form):
    return render(
        request,
        'administrator_dashboard_page.html',
        {"users": users,"form": form}
    )

def createContext1():
    context = []  
    users = User.objects.all()
        
    for user in users:
        if user.is_staff == 1:
            context.append("Administrator")
        elif cast_to_broker(user) is not None:
            context.append("Broker")
        elif cast_to_trader(user) is not None:
            context.append("Trader")
        else:
            context.append("Basic user") 

    ziped = zip(users,context)

    return ziped

@login_required(login_url='login')
def administrator_dashboard(request: HttpRequest):
    if request.user.is_staff == 0:
        return redirect('home')
    
    form = AdministratorDashboardForm()

    return rendering1(request, createContext1(),form)

@login_required(login_url='login')
def administrator_dashboard_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        form = AdministratorDashboardForm(request.POST)
        if(form.is_valid()):
            users = form.cleaned_data.get("choices")
            for user in users:
                user.deleteRow()
        else:
            return rendering1(request, createContext1(), form)
        pass


    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return administrator_dashboard(request)

    return administrator_dashboard(request)

######################################################################################

def rendering2(request, users, form):
    return render(
        request,
        'administrator_dashboard_request.html',
        {"users": users,"form":form}
    )

def createContext2():
    context = []  
    brokerusers = BrokerRequestFile.objects.all()
    
    for broker in brokerusers:
        str = (broker.filepath).filepath.split('/')[2]
        user = User.objects.get(username=str)
        context.append(user) 

    ziped = zip(brokerusers,context)

    return ziped

@login_required(login_url='login')
def administrator_dashboard_request(request: HttpRequest):
    if request.user.is_staff == 0:
        return redirect('home')
    
    form = AdministratorDashboardRequestForm()

    return rendering2(request, createContext2(),form)

@login_required(login_url='login')
def administrator_dashboard_request_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        
        if 'logout' in request.POST:
            return redirect('logut')
        
        form = AdministratorDashboardRequestForm(request.POST)
        if(form.is_valid()):
            print(request.POST)
            if 'delete' in request.POST:
                print("delete")
                brokers = form.cleaned_data.get("choices")
                for broker in brokers:
                    fp = broker.filepath
                    broker.deleteRow()
                    fp.deleteRow() 
            elif 'approve' in request.POST:
                print("approve")
                brokers = form.cleaned_data.get("choices")
                for broker in brokers:
                    username = broker.filepath.filepath.split("/")[2]
                    filetext = TextFile(filepath="brokerBasicUserContract/file/"+username)
                    BrokerContract = ApprovalReportFile(filepath = filetext, approvalcontent="User is approved to become a Broker")
                    BrokerContract.save()

                    user = User.objects.get(username=username)
                    trader = Trader.objects.get(idtrader=user)
                    userbroker = Broker(idbroker=trader)
                    userbroker.save()


        else:
            print("else")
            return administrator_dashboard_request(request)
        pass


    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return administrator_dashboard_request(request)

    return administrator_dashboard_request(request)

#################################################################

def adminlogout(request: HttpRequest):
    return redirect('logout')