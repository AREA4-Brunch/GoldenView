from django.shortcuts import render
import requests


def assetsView(request):
    asset_prices = get_assets()
    context = {"asset_prices": asset_prices}
    return render(request, "assetsView/assetsView.html", context)


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
