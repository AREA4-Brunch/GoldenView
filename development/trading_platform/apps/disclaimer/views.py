from django.shortcuts import render
from django.contrib.auth.decorators import login_required


# Create your views here.


@login_required(login_url='login')
def terms_of_agreement(request):
    # return HttpResponse("Hello <strong>Worlds!</strong>")
    return render(
        request=request,
        template_name='disclaimer/disclaimer_page/disclaimer_page.html',
    )
