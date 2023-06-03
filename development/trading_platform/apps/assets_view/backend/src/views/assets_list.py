import logging
import requests
from django.http import HttpRequest


def get_assets(request: HttpRequest):
    try:
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
        # print(prices)
        if prices:
            pass
            # for asset in prices:
                # print(f"Symbol: {asset['symbol']}, Price: {asset['price']}, Status: {asset['up']}")
        else:
            raise Exception('Failed to retrieve assets\' prices')

        return prices

    except Exception as e:
        # print("Failed to retrieve data")
        request.session['internal_error'] = str(e)
        logging.error(f'Failed to retrieve data: get_assets: {e}')
        return None
