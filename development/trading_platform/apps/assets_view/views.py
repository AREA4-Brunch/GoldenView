import logging

from django.http import HttpRequest, JsonResponse

from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required, user_passes_test
from django.views.decorators.http import require_POST

from apps.common.backend.utils.decorators import if_trader_accept_terms_required, can_user_trade
from .backend.src.views.assets_list import get_assets
from .backend.src.views import asset_view as asset_view_backend
from apps.user_management.backend.src.utils.user_type import cast_to_trader


# Create your views here.


@login_required(login_url='login')
@if_trader_accept_terms_required()
def assets_list(request):
    asset_prices = get_assets(request)
    context = {
        "asset_prices": asset_prices,
        'internal_err': request.session.pop('internal_err', None),
    }
    return render(
        request=request,
        template_name='assets_view/assets_list/assets_list.html',
        context=context
    )


@login_required(login_url='login')
@if_trader_accept_terms_required()
def asset_view(request, symbol: str):
    context = {
        "symbol": symbol,
        'internal_err': request.session.pop('internal_err', None),
    }
    return render(
        request=request,
        template_name='assets_view/asset_view/asset_view.html',
        context=context
    )


@require_POST
@login_required(login_url='login')
@user_passes_test(can_user_trade)
@if_trader_accept_terms_required()
def buy_asset(request: HttpRequest):
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

        request_data['trader'] = trader

        request_data = asset_view_backend.get_cleaned_data(request, response)

        asset_view_backend.send_buy_sell_request(
            is_purchase_request=True,
            request_data=request_data,
            # response=response
        )

        # successfully created request
        response['success_msg'] = 'Request successfuly submitted.'
        status = 200

    except asset_view_backend.InvalidBuySellRequestFormException as e:
        status = 500
        logging.error(f'InvalidBuySellRequestFormException error: {e}')

    except Exception as e:
        status = 500
        response['errors'].append(f'Internal: {e}')
        # ajax request so do not set the internal_error
        # request.session['internal_error'] = str(e)
        logging.error(f'Internal error: {e}')

    finally:
        return JsonResponse(response, status=status)


@login_required(login_url='login')
@user_passes_test(can_user_trade)
@if_trader_accept_terms_required()
def sell_asset(request: HttpRequest):
    asset_prices = get_assets()
    context = {
        "asset_prices": asset_prices,
        'internal_err': request.session.pop('internal_err', None),
    }
    # return render(
    #     request=request,
    #     template_name='assets_view/assets_list/assets_list.html',
    #     context=context
    # )

    response = {
    }

    return JsonResponse(response)
