# Aleksandar Radenkovic 2020/0272
from django.shortcuts import render
from django.http import HttpRequest


def page_404(request: HttpRequest):
    context = {
        'url': request.session.pop('link_404', None)
    }

    return render(
        request=request,
        template_name='common/page_404.html',
        context=context
    )
