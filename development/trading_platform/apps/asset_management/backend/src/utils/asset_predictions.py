# Aleksandar Radenkovic 2020/0272
import random
import logging

from apps.asset_management.models import AssetStats, Asset

# generating value for the prediction
def generate_asset_values_predictions(asset_id:int, start_day, num_days_to_predict: int):
    predictions = [
        random.randint(250, 350)
        for _ in range(num_days_to_predict)
    ]

    return predictions

# show daily predictions
def upsert_asset_values_predictions(asset_id, start_day, predictions):
    """ Update or insert if did not exist. """

    daily_predictions = AssetStats.DailyPredictions(
        start_day=start_day,
        pred_vals=predictions
    )

    asset_stats = AssetStats.objects(asset_id=asset_id).first()

    if not asset_stats:  # create
        asset_stats = AssetStats(
            asset_id=asset_id,
            daily_predictions=daily_predictions
        )

    else:
        # print(f'Previous daily_predictions: {asset_stats.daily_predictions.pred_vals}')
        asset_stats.daily_predictions = daily_predictions

    asset_stats.save()

# function for getting the values of predictions
def fetch_asset_values_predictions(asset_ticker_symbol: str):
    try:
        asset_id = Asset.objects.get(tickersymbol=asset_ticker_symbol).idasset
    except Asset.DoesNotExist as e:
        logging.error(f'Given asset does not exist: {asset_ticker_symbol}')
        return {}

    asset_stats = AssetStats.objects(asset_id=asset_id).first()
    return asset_stats.daily_predictions
