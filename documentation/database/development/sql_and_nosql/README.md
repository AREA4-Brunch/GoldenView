For Users, Groups and Roles using pattern RoleBasedSecurity found here:
https://dba.stackexchange.com/questions/12046/what-is-a-basic-model-for-making-a-database-with-users-and-groups


Admin does not have the access to buying selling stocks etc. it is not superuser it is just an admin.

Balance and user's financial info is handled application wise, via APIs and their payment gateways ???

WasAccepted should by default be false.

Possible reduction of Broker and BasicUser into Trader table, simplifies broker request.

DidExpire field set to true for default and then change into false only upon successful password change.

Real time assets view endpoint Django returns only static webpage, js parses and displays all the data as it
is all publicly available and probably fomratted it should be no company secret and it would be fastest.
Consider obfuscating and dirtifying the js. When checking the box to predict future then sends request to
endpoint with query param that matches the company id and fetches the data and the time when the prediction was
calculated.

BrokerRequest perfect for nosql, but why since it does not need to be fast, plus django could handle this real
nice with admin page funcs it has.
SupportRequest perfect for nosql.
Storing predictions on asset price perfect for nosql.

TickerSymbol should be unique.
Username should be unique ???
Email should be unique ???
Quantity must be striclty greater than 0.

Explain what is ticker symbol in Section 1.4 in db specificatio doc.

Should relational db reduction be done at this phase or when we get to implementation ??

Sharding could be done based on trader's country on portfolios.

TradeRequest in sql IE db is an active trade request, inactive ones are in nosql in portfolios.

Checking if there is enough money per transaction is done application wise, but if not relying on other sys such
as banking system to store the info about the user's balance then it is within the PaymentMethod.

Key in PaymentMethod must be encrypted.
Password in User must be encrypted.

One AssetTransaction is identified by TradeRequest since it may not have been fulfilled 

Chronological sort of trader requests in portfolio is done by IdTradeRequest since it will be auto increment,
same thing for matching requests.

Trader within app sets the user they are trading for at the moment, they can view only that users
requests then (should only view the ones they made themself)

IdUser in TradeRequest represents the user who will own the asset or the funds (so brokers client in case of
broker trading in name of their client).

Broker could based on contract id see all the trades they made.
QuantityReserved are assets acquired over trade request
FeePaid is the amount of money transferred to broker after entire traderequest was carried out, in case of insufficient
funds this field has negative value and basic user is in breach of contract which is now broker's to handle. Better than
bool as it is useful info for further analysis.

TradeRequest in SQL db represents the one that is not yet filled, else it would be moved to nosql where it becomes unstructered
beacuse some of those could store the binded by contract id information.
AssetTransactions are entirely stored in nosql.
BindedByContract can be nosql table or embedded into trade request.
PricePrediction is a nosql table ???
Techincal Support Request should be in nosql, Msg, Name, Email, Status

