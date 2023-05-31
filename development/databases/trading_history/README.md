MongoDB stores all of its `platform_history` database during development in `mongodb_data/`. This can be configured by changing default behaviour of `configure_db_trading_history` command, in the `db_config/db_connection.ini` that path as well as the paths to log folder and MongoDB (mongod.exe) can be configured.
(More about the command in `/development/trading_platform/deployment/management/commands/README.md`)

In `db_config/models.py` are the models using the mongoengine as
it provides ORM for Django. It relies on PyMongo which also has
to be installed via pip.
