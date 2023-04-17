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

BrokerRequest perfect for nosql.
SupportRequest perfect for nosql.
Storing predictions on asset price perfect for nosql.

TickerSymbol should be unique.
Username should be unique ???
Email should be unique ???
