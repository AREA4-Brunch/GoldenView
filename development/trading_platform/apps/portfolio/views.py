from django.http import HttpRequest
from django.shortcuts import render

# Create your views here.
def portfolio(request: HttpRequest):
    transactions = []
    return render(
        request,
        "portfolio/footer/portfolio_page.html",
        {
            "transactions" : transactions
        }
    )