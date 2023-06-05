import logging
from django.http import HttpRequest
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required

from ..administrator_dashboard.backend.src.view.form import AdministratorDashboardForm
from ..user_management.backend.src.utils.user_type import cast_to_trader, cast_to_broker

from ..user_management.models import User

# Create your views here.

def rendering(request, form, users):
    return render(
        request,
        'administrator_dashboard_page.html',
        {"form": form, "users": users,}
    )

def rendering2(request, form, users):
    return render(
        request,
        'administrator_dashboard_request.html',
        {"form": form, "users": users,}
    )

def createContext():
    context = []  
    users = User.objects.all()
    
    for user in users:
        if user.is_staff == 1:
            context.append("Administrator")
        elif cast_to_trader(user) is not None:
            context.append("Trader")
        elif cast_to_broker(user) is not None:
            context.append("Broker")
        else:
            context.append("Basic user") 

    ziped = zip(users,context)
    return ziped

@login_required(login_url='login')
def administrator_dashboard(request: HttpRequest):
    if request.user.is_staff == 0:
        return redirect('home')
    
    form = AdministratorDashboardForm()

    return rendering(request, form, createContext())

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
        
            return rendering(request, form, createContext())

        pass


    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return rendering(request, form, createContext())

    return rendering(request, form, createContext())

@login_required(login_url='login')
def administrator_dashboard_request(request: HttpRequest):
    if request.user.is_staff == 0:
        return redirect('home')
    
    form = AdministratorDashboardForm()

    return rendering2(request, form, createContext())

@login_required(login_url='login')
def administrator_dashboard_request_form(request: HttpRequest):
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
        
            return rendering2(request, form, createContext())

        pass


    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return redirect('broker_request')

    return rendering2(request, form, createContext())