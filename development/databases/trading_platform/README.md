`trading_platform_django_built_in` is not used currently. Can be configured
for better separation of concerns but too much work, currently less optimal
and a bad idea :(

Used Django managed=True to generate the db after tweaking an inspectdb after
executing `../db_scripts/init_no_django.sql` and dropping the db and then
generating via `python manage.py makemigrations` and `python manage.py migrate`.

trading_platform scripts lack some UNIQUE keywords, for email for example,
managed that within Django models. Converting to snake case and more descriptive
foreign key names would be an improvement.
