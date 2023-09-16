Indexes to be raised over columns in tables
(primary keys not in list as they should all have an index).

Asset
    tickersymbol - Unique Index


MakeBeliefOwns
    idasset - Unique Index


FundsTransferMethod
    idtrader - Unique Index


PurchaseRequest
    unitpricelowerbound - B Tree Index
    unitpriceupperbound - B Tree Index
    idasset - Unique Index
    iduser - Unique Index
    idcontract - Unique Index


SalesRequest
    unitpricelowerbound - B Tree Index
    unitpriceupperbound - B Tree Index
    idasset - Unique Index
    iduser - Unique Index
    idcontract - Unique Index


BrokerBasicUserContract
    idbasicuser - Unique Index
    idbroker - Unique Index
