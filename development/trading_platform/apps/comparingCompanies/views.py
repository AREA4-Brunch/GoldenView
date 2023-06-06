from django.http import HttpRequest
from django.shortcuts import render

# Create your views here.
def comparingCompanies(request: HttpRequest):

    return render(
        request,
        "comparingCompanies/footer/comparingCompanies.html",
    )


