import logging

from django.shortcuts import render, redirect
from django.http import HttpRequest
from django.contrib.auth.decorators import login_required


# Create your views here.
from apps.user_management.backend.src.utils.user_type import cast_to_trader
from .backend.src.views.wallet_page import (
    fetch_all_transfer_methods,
    fetch_all_makebeliefowns_assets,
)
# from .models import FundsTransferMethod
from apps.user_management.models import FundsTransferMethod



@login_required(login_url='login')
def wallet_status(request: HttpRequest):
    context = {
        'internal_err': request.session.pop('internal_err', None),
    }

    try:
        trader = cast_to_trader(request.user)
        if trader is None:
            raise Exception('Only traders have access.')

        # if no transfer method set by user redirect them to create one
        if trader.idselectedfundstransfermethod is None:
            return redirect('create_funds_transfer_method')

        # get requested tm or the default one
        transfer_method_id = int(request.POST.get(
            'transfer-methods',
            trader.idselectedfundstransfermethod.pk
        ))

        selected_tm_balance = FundsTransferMethod.objects.get(
            idpaymentmethod=transfer_method_id,
        ).makebeliefbalance

        context.update({
            'is_default_tm': transfer_method_id == trader.idselectedfundstransfermethod.pk,
            'selected_tm_id': transfer_method_id,
            'selected_tm_balance': selected_tm_balance,
            'tranfer_methods': fetch_all_transfer_methods(trader.pk),
            'assets_owned': fetch_all_makebeliefowns_assets(
                transfer_method_id
            ),
        })

    except Exception as e:
        context['internal_err'] = context['internal_err'] or '' \
                                + f'\nInternal error: {e}'
        logging.exception(f'Internal error: {e}')

    return render(
        request=request,
        template_name='wallet/wallet_page/wallet_page.html',
        context=context
    )


@login_required(login_url='login')
def update_transfer_method_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    class MissingFieldError(Exception):
        pass

    try:
        trader = cast_to_trader(request.user)
        if trader is None:
            raise Exception('Only traders have access.')

        new_default_transfer_method_id = request.POST.get(
            'transfer-methods', None
        )
        if new_default_transfer_method_id is None:
            raise MissingFieldError('No transfer method option selected.')

        # set the new payment method as default/selected
        trader.idselectedfundstransfermethod = FundsTransferMethod.objects.get(
            idpaymentmethod=new_default_transfer_method_id
        )

        trader.save()
        request.session['internal_err'] = 'Successfuly set as primary funds transfer account.'

    except MissingFieldError as e:
        request.session['internal_err'] = str(e)
        return redirect('wallet_status')

    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return redirect('wallet_status')

    return redirect('wallet_status')


@login_required(login_url='login')
def create_funds_transfer_method(request: HttpRequest):
    context = {
        'internal_err': request.session.pop('internal_err', None),
    }

    return render(
        request=request,
        template_name='wallet/create_funds_transfer_method/create_funds_transfer_method.html',
        context=context
    )


@login_required(login_url='login')
def create_funds_transfer_method_form(request: HttpRequest):
    if request.method == 'GET':
        request.session['link_404'] = request.get_full_path()
        return redirect('page_404')

    class InvalidField(Exception):
        pass

    def get_access_key():
        access_key = request.POST.get('access-key', '')

        if access_key is None or access_key == '':
            raise InvalidField('No access_key provided.')

        return access_key

    def get_makebelief_balance():
        makebelief_balance = request.POST.get(
            'makebelief_balance', '0'
        )

        if makebelief_balance is None:
            raise InvalidField('Invalid makebelief_balance provided.')

        if makebelief_balance.strip() == '':
            makebelief_balance = 0.
        else:
            makebelief_balance = float(makebelief_balance)

        if makebelief_balance < 0:
            raise InvalidField('Invalid makebelief_balance provided.')

        return makebelief_balance

    try:
        trader = cast_to_trader(request.user)
        if trader is None:
            raise Exception('Only traders have access.')

        access_key = get_access_key()
        makebelief_balance = get_makebelief_balance()

        # set the new payment method as default/selected
        funds = FundsTransferMethod.objects.create(
            accesskey=access_key,
            idtrader=trader,
            makebeliefbalance=makebelief_balance,
        )

        # if user has no selected transfer method set newly
        # created one
        trader.idselectedfundstransfermethod = funds
        trader.save()

    except InvalidField as e:
        request.session['internal_err'] = str(e)
        return redirect('create_funds_transfer_method')

    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        return redirect('create_funds_transfer_method')

    return redirect('wallet_status')
