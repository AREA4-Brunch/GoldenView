# Aleksandar Radenkovic 2020/0272
from django.shortcuts import render, redirect
from django.http import HttpRequest
from django.contrib.auth.decorators import login_required


from apps.user_management.backend.src.utils.user_type import cast_to_administrator, \
                                                             cast_to_basic, cast_to_broker


def page_404(request: HttpRequest):
    context = {
        'url': request.session.pop('link_404', None)
    }

    return render(
        request=request,
        template_name='common/page_404.html',
        context=context
    )


@login_required(login_url='login')
def dashboard_redirect(request: HttpRequest):
    if cast_to_broker(request.user) is not None:
        return redirect('broker_dashboard_page')

    if cast_to_administrator(request.user) is not None:
        return redirect('administrator_dashboard_page')

    if cast_to_basic(request.user) is not None:
        return redirect('user_dashboard_page')

    return redirect('page_404')
