"""
    Jovana Bjelica 2020/0349
    Aleksandar Radenkovic 2020/0272
"""

import logging

from django.http import HttpRequest, JsonResponse

from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required, user_passes_test
from django.views.decorators.http import require_POST

from apps.common.backend.utils.decorators import if_trader_accept_terms_required, \
                                                 can_user_trade
from apps.user_management.backend.src.utils.user_type import cast_to_trader
from apps.asset_management.backend.src.utils import portfolio as portfolio_core

from .backend.src.views import portfolio_page, modify_trade_request
from .backend.src.utils import cleaning_data

from apps.asset_management.backend.src.utils.trading import match_traders_request


# Create your views here.


@login_required(login_url='login')
@if_trader_accept_terms_required()
def portfolio(request: HttpRequest):
    """
        View for serving all the user's trade requests.
    """

    context = {
        'transactions': [],
    }

    try:
        trader = cast_to_trader(request.user)
        if trader is None:
            raise Exception('Only traders have access.')

        request_data = portfolio_page.get_cleaned_data(request, context)
        request_data['trader'] = trader

        portfolio_page.fetch_all_users_trade_requests(
            request_data=request_data,
            context=context
        )

    except portfolio_page.InvalidForm as e:
        logging.error(f'InvalidForm error: {e}')

    except Exception as e:
        context['internal_err'] = f'Internal error: {e}'
        # ajax request so do not set the internal_error
        # request.session['internal_error'] = str(e)
        logging.exception(f'Internal error: {e}')

    finally:
        return render(
            request=request,
            template_name="portfolio/portfolio_page/portfolio_page.html",
            context=context
        )


@require_POST
@login_required(login_url='login')
@user_passes_test(can_user_trade)
@if_trader_accept_terms_required()
def cancel_active_trade_request(request: HttpRequest):
    """
        View for handling the cancelation of active trade requests.
    """

    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

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

        request_data = { "trader": trader }
        request_data = cleaning_data.get_cleaned_data_from_trade_request_row(
            request=request,
            response=response,
            request_data=request_data
        )

        quantity_at_which_stopped, value_at_which_stopped \
            = portfolio_core.cancel_active_trade_request(
                trade_request=request_data["trade_request"],
                is_purchase_request=request_data["is_purchase_request"]
            )

        # successfully created request
        status = 200
        response['success_msg'] = 'Successfuly cancelled the trade request.'
        response['quantity_at_which_stopped'] = quantity_at_which_stopped
        response['value_at_which_stopped'] = value_at_which_stopped

    except cleaning_data.InvalidForm as e:
        status = 200
        err_msg = "\n".join(response["errors"])
        logging.error(f'InvalidForm error(s): {err_msg}')

    except Exception as e:
        status = 500
        response['errors'].append(f'Internal: {e}')
        # ajax request so do not set the internal_error
        # request.session['internal_error'] = str(e)
        err_msg = "\n".join(response["errors"])
        logging.exception(f'Internal error(s): {err_msg}')

    finally:
        return JsonResponse(response, status=status)


@require_POST
@login_required(login_url='login')
@user_passes_test(can_user_trade)
@if_trader_accept_terms_required()
def modify_active_trade_request(request: HttpRequest):
    """
        View for handling the cancelation of active trade requests.
    """

    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

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

        request_data = { "trader": trader }
        request_data = modify_trade_request.get_cleaned_data(
            request=request,
            response=response,
            request_data=request_data
        )

        quantity_required_at_which_stopped, quantity_requested_at_which_stopped, \
        value_at_which_stopped, lower_bound_at_which_stopped, \
        upper_bound_at_which_stopped, did_fulfill \
            = portfolio_core.modify_active_trade_request(
                trade_request=request_data["trade_request"],
                is_purchase_request=request_data["is_purchase_request"],
                new_quantityrequested=request_data["quantity"],
                new_unitpricelowerbound=request_data["lowerbound"],
                new_unitpriceupperbound=request_data["upperbound"]
            )

        try:
            match_traders_request(
                is_purchase_request=request_data["is_purchase_request"],
                request_id=request_data["trade_request"].pk
            )
        except Exception as e:
            logging.exception('Failed to start match traders request task after successful reqeust update.')

        # successfully created request
        status = 200
        response['success_msg'] = 'Successfuly updated the trade request.'
        response['quantity_required_at_which_stopped'] = quantity_required_at_which_stopped
        response['quantity_requested_at_which_stopped'] = quantity_requested_at_which_stopped
        response['value_at_which_stopped'] = value_at_which_stopped
        response['did_fulfill'] = did_fulfill
        response['lower_bound_at_which_stopped'] = lower_bound_at_which_stopped
        response['upper_bound_at_which_stopped'] = upper_bound_at_which_stopped

    except modify_trade_request.InvalidForm as e:
        status = 200
        err_msg = "\n".join(response["errors"])
        logging.error(f'InvalidForm error(s): {err_msg}')

    except Exception as e:
        status = 500
        response['errors'].append(f'Internal: {e}')
        # ajax request so do not set the internal_error
        # request.session['internal_error'] = str(e)
        err_msg = "\n".join(response["errors"])
        logging.exception(f'Internal error(s): {err_msg}')

    finally:
        return JsonResponse(response, status=status)
