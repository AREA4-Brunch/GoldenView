from django.http import HttpRequest
from django.shortcuts import render

# Create your views here.
def portfolio(request: HttpRequest):
    transactions = []
    return render(
        request,
        "portfolio/footer/portfolio_page.html",
        {
            "transactions" : transactions
        }
    )
import logging

from django.http import HttpRequest, JsonResponse

from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required, user_passes_test
from django.views.decorators.http import require_POST

from apps.common.backend.utils.decorators import if_trader_accept_terms_required
from apps.user_management.backend.src.utils.user_type import cast_to_trader
from .backend.src.views import portfolio_page


# Create your views here.


@login_required(login_url='login')
@if_trader_accept_terms_required()
def portfolio(request: HttpRequest):
    if request.method == 'GET':
        return render(
            
        )
        
        
    status = 500
    response = {
        'success_msg': '',
        'errors': []
    }

    try:
        trader = cast_to_trader(request.user)
        if trader is None:
            logging.error(f'How did user iduser=`{request.user.iduser}` end up in `can_trade` group?')
            raise Exception('Only traders can make purchases.')

        request_data = portfolio_page.get_cleaned_data(request, response)
        
        if request_data['contract'] is None:
            request_data['trader'] = trader
        else:
            request_data['trader'] = request_data['contract'].idbasicuser.idbasicuser

        portfolio_page.fetch_all_users_trade_requests(
            request_data=request_data
            # response=response
        )

        # successfully created request
        response['success_msg'] = 'Request successfuly submitted.'
        status = 200

    except portfolio_page.InvalidForm as e:
        status = 500
        logging.error(f'InvalidForm error: {e}')

    except Exception as e:
        status = 500
        response['errors'].append(f'Internal: {e}')
        # ajax request so do not set the internal_error
        # request.session['internal_error'] = str(e)
        logging.exception(f'Internal error: {e}')

    finally:
        return JsonResponse(response, status=status)



