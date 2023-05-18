from django.core.management import call_command
from django.core.management.base import BaseCommand, CommandError

class Command(BaseCommand):
    help = 'Sets the environment variables for the database(s) default configurations.'
    name = 'configure_db'

    def handle(self, *args, **options):
        self._setupTradingPlatformDatabase()
        self._setupTradingHistoryDatabase()

    def _setupTradingPlatformDatabase(self, **options):
        call_command("configure_db_trading_platform")

    def _setupTradingHistoryDatabase(self, **options):
        # TODO
        return
