from django.http import HttpRequest
from django.shortcuts import render

# Create your views here.


def comparing_companies(request: HttpRequest):

    return render(
        request,
        "comparing_companies/comparing_companies_page/comparing_companies.html",
    )
