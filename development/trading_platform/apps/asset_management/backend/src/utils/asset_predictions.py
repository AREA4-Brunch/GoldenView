import random

from apps.asset_management.models import AssetStats


def generate_asset_values_predictions(asset_id:int, start_day, num_days_to_predict: int):
    predictions = [
        random.randint(250, 350)
        for _ in range(num_days_to_predict)
    ]

    return predictions


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
