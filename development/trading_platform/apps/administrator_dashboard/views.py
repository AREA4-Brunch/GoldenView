# Jovan Jovanovic 2020/0083 and Jovana Bjelica 2020/0349
import logging
from django.http import HttpRequest
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required

from apps.administrator_dashboard.backend.src.view.form import AdministratorDashboardForm, AdministratorDashboardRequestForm
from apps.user_management.backend.src.utils.user_type import cast_to_trader, cast_to_broker, cast_to_administrator

from apps.file_management.models import ApprovalReportFile, BrokerRequestFile, TextFile
from apps.user_management.models import Trader, User
from apps.broker_management.models import Broker

# Create your views here.

# render the page
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


#render admin dashboard
@login_required(login_url='login')
def administrator_dashboard(request: HttpRequest):
    # if request.user.is_staff == 0:
    #     return redirect('home')

    # if reqeust.user is not Administrator object then
    # it has no access to this feature
    # if not hasattr(request.user, 'idadministrator'):
    if cast_to_administrator(request.user) is None:
        return redirect('home')

    form = AdministratorDashboardForm()

    return rendering1(request, createContext1(),form)

# form/table for the admin dashboard
@login_required(login_url='login')
def administrator_dashboard_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        form = AdministratorDashboardForm(request.POST)
        if(form.is_valid()):
            user=""
            for i in User.objects.all():
                if i.username in request.POST:
                    user=i
                    break
            
            user.deleteRow()
        else:
            return administrator_dashboard(request)
        pass


    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return administrator_dashboard(request)

    return administrator_dashboard(request)

######################################################################################

# render request
def rendering2(request, users, form):
    return render(
        request,
        'administrator_dashboard_request.html',
        {"users": users,"form":form}
    )

# request of brokers maker
def createContext2():
    context = []  
    brokerusers = BrokerRequestFile.objects.all()
    
    for broker in brokerusers:
        str = (broker.filepath).filepath.split('/')[2]
        user = User.objects.get(username=str)
        context.append(user) 

    ziped = zip(brokerusers,context)

    return ziped

# admin request form/tablee
@login_required(login_url='login')
def administrator_dashboard_request(request: HttpRequest):
    # if request.user.is_staff == 0:
    #     return redirect('home')

    # if reqeust.user is not Administrator object then
    # it has no access to this feature
    # if not hasattr(request.user, 'idadministrator'):
    if cast_to_administrator(request.user) is None:
        return redirect('home')

    form = AdministratorDashboardRequestForm()

    return rendering2(request, createContext2(),form)

# delete user with admin form/table
@login_required(login_url='login')
def administrator_dashboard_request_delete_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:

        form = AdministratorDashboardRequestForm(request.POST)
        if(form.is_valid()):
            broker=""
            for i in BrokerRequestFile.objects.all():
                if i.filepath.filepath in request.POST:
                    broker=i
                    break

            fp = broker.filepath
            broker.deleteRow()
            fp.deleteRow() 

        else:
            print("else")
            return administrator_dashboard_request(request)
        pass


    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return administrator_dashboard_request(request)

    return administrator_dashboard_request(request)

# approve request with admin form/table
@login_required(login_url='login')
def administrator_dashboard_request_approve_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:

        form = AdministratorDashboardRequestForm(request.POST)
        if(form.is_valid()):
            print(request.POST)
            broker=""
            for i in BrokerRequestFile.objects.all():
                if i.filepath.filepath in request.POST:
                    broker=i
                    break
            
            username = broker.filepath.filepath.split("/")[2]
            filetext = TextFile(filepath="brokerApprovalContract/file/"+username)
            filetext.save()
            BrokerContract = ApprovalReportFile(filepath = filetext, approvalcontent="User is approved to become a Broker")
            BrokerContract.save()

            user = User.objects.get(username=username)
            trader = Trader.objects.get(idtrader=user)
            userbroker = Broker(idbroker=trader)
            userbroker.save()

            fp = broker.filepath
            broker.deleteRow()
            fp.deleteRow() 

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

# logout from account
def adminlogout(request: HttpRequest):
    return redirect('logout')