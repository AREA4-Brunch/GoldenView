from django.shortcuts import render

# Create your views here.


def home(request):
    context = {
        'internal_err': request.session.pop('internal_err', None),
    }
    
    # return HttpResponse("Hello <strong>Worlds!</strong>")
    return render(
        request=request,
        template_name='website/landing_page/landing_page.html',
        context=context
    )
