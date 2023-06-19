# Jovana Bjelica 2020/0349
import logging
from django.http import HttpRequest
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required

from django.contrib.auth.hashers import check_password, make_password

from ..user_management.models import User
from ..password_reset.backend.src.views.forms import PasswordResetForm

# render the page
def rendering(request, form, errold, errnew):
    return render(
        request,
        'password_reset.html',
        {"form": form, "errold": errold, "errnew": errnew}
    )
# request for reset of password
@login_required(login_url='login')
def password_reset(request: HttpRequest):

    form = PasswordResetForm()

    return rendering(request,form,"","")

# function for the form of the password reset, inputs
@login_required(login_url='login')
def password_reset_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        #TODO: izloguje se kada se promeni sifra, ne znam dal je bag ili feature

        form = PasswordResetForm(request.POST)
        if(form.is_valid()):
            old = form.cleaned_data['old']
            new = form.cleaned_data['new']
            #print(old,new)
            #print(request.user.username)
            user = User.objects.get(username=request.user.username)

            if(check_password(old, user.password)==False):
                return rendering(request, form, "Enter your old password", "")
            if (old == new):
                errmsg = ""
                errmsg += "New password is the same as old one"
                return rendering(request, form, "", errmsg.split("\n"))

            #TODO: add restrictions for making new password
            special_characters = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{{}|~"
            flaghasspec=False
            flaghasnum=False
            flaghaslc=False
            flaghasuc=False
            size=0
            for c in new:
                if c.isnumeric(): flaghasnum=True
                if c.islower(): flaghaslc=True
                if c.isupper(): flaghasuc=True
                if c in special_characters: flaghasspec=True
                size+=1

            if size>=8 and flaghasnum and flaghaslc and flaghasspec and flaghasuc:
                new = make_password(new)
                user.password=new
                user.save()
            else:
                errmsg=""
                if size<8: errmsg+="Your password must contain at least 8 characters.\n"
                if flaghasuc==False: errmsg+="Your password must contain at least 1 uppercase characters.\n"
                if flaghaslc==False: errmsg+="Your password must contain at least 1 lowercase characters.\n"
                if flaghasnum==False: errmsg+="Your password must contain at least 1 digits.\n"
                if flaghasspec==False: errmsg+="Your password must contain at least 1 special characters.\n"

                return rendering(request, form, "", errmsg.split("\n"))
        else:
            wrongold=""
            wrongnew=""
            if(form.data['old']==""): wrongold="You can't leave this field empty"
            if(form.data['new']==""): wrongnew="You can't leave this field empty"

            return rendering(request, form, wrongold,wrongnew.split("\n"))
        pass

    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return redirect('password_reset')

    return redirect('password_reset')

# cancel reset, return to homeS
def cancel_reset(request:HttpRequest):
    return redirect('home')