from django.shortcuts import render, redirect, HttpResponse

# Create your views here.


def home(request):
    # return HttpResponse("Hello <strong>Worlds!</strong>")
    return render(
        request=request,
        template_name='landing_page/landing_page.html',
    )
