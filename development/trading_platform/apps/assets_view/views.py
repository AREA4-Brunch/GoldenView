from django.shortcuts import render
import requests

# Create your views here.


def assets_list(request):
    asset_prices = get_assets()
    context = {"asset_prices": asset_prices}
    return render(
        request=request,
        template_name='assets_view/assets_list/assets_list.html',
    )


def asset_view(request, symbol: str):
    context = {"symbol": symbol}
    return render(
        request=request,
        template_name='assets_view/asset_view/asset_view.html',
        context=context
    )

def get_assets():
    symbols = ["MSFT", "AAPL", "AMZN", "NKE", "TSLA"]
    prices = []
    if symbols:
        url = "https://www.alphavantage.co/query"
        for symbol in symbols:
            params = {
                "function": "GLOBAL_QUOTE",
                "symbol": symbol,
                "apikey": "Q4X0LY9G8KCL9UYP"
            }

            response = requests.get(url, params=params)
            data = response.json()

            if "Global Quote" in data:
                price = float(data["Global Quote"]["05. price"])
                up = float(data["Global Quote"]["09. change"]) > 0
                prices.append({
                    "symbol": symbol,
                    "price": price,
                    "up": up
                })
    print(prices)
    if prices:
        for asset in prices:
            print(f"Symbol: {asset['symbol']}, Price: {asset['price']}, Status: {asset['up']}")
    else:
        print("Failed to retrieve data")
    return prices