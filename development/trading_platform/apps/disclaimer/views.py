# Jovan Jovanovic 2020/0083
import logging
from django.http import HttpRequest
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from ..user_management.backend.src.utils.user_type import cast_to_trader

from apps.user_management.backend.src.utils.user_type import cast_to_trader


# Create your views here.
from ..user_management.backend.src.utils.user_terms import did_accept_terms, accept_terms

# request for TOA
@login_required(login_url='login')
def terms_of_agreement(request: HttpRequest):
    
    #if not is_trader(request.user):
        #return redirect('register')

    context = {
        'checkbox_err': request.session.pop('checkbox_err', None),

        'internal_err': request.session.pop('internal_err', None),
    }

    return render(
        request=request,
        template_name='disclaimer/disclaimer_page/disclaimer_page.html',
        context=context
    )


# function for accepting the TOA
@login_required(login_url='login')
def accept_terms_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    try:
        trader = cast_to_trader(request.user)
        if trader is None:
            request.session['internal_err'] = 'These terms are meant only for Trader type of users.'
            return redirect('disclaimer_page')

        if did_accept_terms(trader):
            request.session['internal_err'] = 'You have already accepted the terms.'
            return redirect('home')

        accept_terms(trader)

    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return redirect('disclaimer_page')

    return redirect('home')
