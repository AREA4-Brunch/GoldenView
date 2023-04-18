{
    <!-- from the SQL db - ActiveTradeRequest table -->
    "_id": 5,

    <!-- id of user whose account receieves/sends funds
         in SQL db - Trader entity - IdUser
    -->
    "id_user": 1,

    <!-- id of asset the request is regarding in SQL db - Asset table -->
    "id_asset": 1,

    <!-- total number of assets transactioned -->
    "quantity": 500,

    <!-- value of all assets transactioned (rounded to 2 decimals) -->
    "total_price": 137875,

    <!-- [Optional] contract it was binded by -->
    "contract": {
        <!-- in SQL db - BrokerBasicUserContract table - IdContract -->
        "_id": 1,

        <!-- time (ISODate) at which the request was rendered complete/carried out
             and broker's fee was charged
        -->
        "time": "2023-04-18T14:30:01.000Z",

        <!-- OK/FB/FBU
            OK - fee was transferred from basic user's account to broker's
            FB - fee not transferred error with broker's FundsTransferMethod (in SQL db)
            FBU - fee not transferred error with basic user's FundsTransferMethod (in SQL db)
        -->
        "status": "OK",

        <!-- [Optional] fee charged to user (id_user) and transferred to broker
             in case of successful transaction.
        -->
        "fee_paid": 1234.21
    }
}
