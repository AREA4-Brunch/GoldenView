from django.shortcuts import render

# Create your views here.


def terms_of_agreement(request):
    # return HttpResponse("Hello <strong>Worlds!</strong>")
    return render(
        request=request,
        template_name='disclaimer/disclaimer_page/disclaimer_page.html',
    )
