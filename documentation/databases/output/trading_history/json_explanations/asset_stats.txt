{
    <!-- id of asset whom stats are regarding in SQL db - Asset table -->
    "_id": 1,

    <!-- id of request created in SQL db - ActiveTradeRequest table -->
    "daily_predictions": {
        <!-- first day (ISO 8601) from which predictions start (inclusive) -->
        "start_day": "2023-06-21",

        <!-- predicted daily asset values, length dictates end_day -->
        "pred_vals": [
            275.87,
            276.17,
            232.37,
            298
        ]
    }
}
