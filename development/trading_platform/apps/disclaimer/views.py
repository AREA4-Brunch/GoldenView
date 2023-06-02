import logging
from django.http import HttpRequest
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from ..user_management.backend.src.utils.user_type import is_trader

from ..user_management.models import Trader, User

# Create your views here.
from ..user_management.backend.src.utils.user_terms import did_accept_terms, accept_terms

@login_required(login_url='login')
def terms_of_agreement(request: HttpRequest):
    
    #if not is_trader(request.user):
        #return redirect('register')

    try:
        if did_accept_terms(Trader(request.user)):
            return redirect('home')

    except Exception as e:
        return redirect('home')

    context = {
        'checkbox_err': request.session.pop('checkbox_err', None),

        'internal_err': request.session.pop('internal_err', None),
    }

    return render(
        request=request,
        template_name='disclaimer/disclaimer_page/disclaimer_page.html',
        context=context
    )


@login_required(login_url='login')
def accept_terms_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        accept_terms(Trader(request.user))

    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return redirect('disclaimer_page')

    return redirect('home')
