# Andrej Dujovic 2020/0306
import logging
import requests
from django.http import HttpRequest

from apps.asset_management.models import Asset


# function for getting asset data from the Alpha Vantage API, limited to 5 because of API
def get_assets(request: HttpRequest):
    try:
        request.session['internal_error'] = ''

        # symbols = ["MSFT", "AAPL", "AMZN", "NKE", "TSLA"]
        symbols = [asset.tickersymbol for asset in Asset.objects.all()]

        prices = []
        if symbols:
            url = "https://www.alphavantage.co/query"
            for symbol in symbols:
                try:
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

                except Exception as e:
                    request.session['internal_error'] += f'Failed to fetch data for {symbol}'
                    prices.append({
                        "symbol": symbol,
                        "price": 'NA',
                        "up": 'NA'
                    })
                    logging.error(f'Failed to fetch assets increase/decrease data for {symbol}')

        # print(prices)
        if prices:
            pass
            # for asset in prices:
                # print(f"Symbol: {asset['symbol']}, Price: {asset['price']}, Status: {asset['up']}")
        else:
            raise Exception('Failed to retrieve any assets\' prices')

        return prices

    except Exception as e:
        # print("Failed to retrieve data")
        request.session['internal_error'] = str(e)
        logging.exception(f'Failed to retrieve data: get_assets: {e}')
        return None
