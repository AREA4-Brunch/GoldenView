import os
import configparser

from django.core.management.base import BaseCommand, CommandError
from django.conf import settings

BASE_DIR = settings.BASE_DIR
READ_MNGMNT_CMNDS_DOCS_MSG = settings.READ_MNGMNT_CMNDS_DOCS_MSG


class Command(BaseCommand):
    help = 'Sets the environment variables for the database(s) configuration'
    name = 'configure_db_trading_platform'

    DEFAULT_DB_CONFIG_PATH = os.path.join(BASE_DIR, "../databases/trading_platform/db_config")

    def add_arguments(self, parser):
        # optional arguments:
        parser.add_argument(
            '-cs', '--config-src',
            type=str,
            help='Path to folder representing db cofig, must contain db_connection.ini.'
        )

    def handle(self, *args, **options):
        # setup default config files path if not provided
        if options["config_src"] is None:
            options["config_src"] = Command.DEFAULT_DB_CONFIG_PATH

        # read the database connection information from the .ini file
        config = configparser.ConfigParser()
        config.read(os.path.join(options["config_src"], "db_connection.ini"))

        # set the environment variables
        try:
            os.environ['DB_TRADING_PLATFORM_NAME'] = config['TRADING_PLATFORM']['name']
            os.environ['DB_TRADING_PLATFORM_USER'] = config['TRADING_PLATFORM']['user']
            os.environ['DB_TRADING_PLATFORM_PASSWORD'] = config['TRADING_PLATFORM']['password']
            os.environ['DB_TRADING_PLATFORM_HOST'] = config['TRADING_PLATFORM']['host']
            os.environ['DB_TRADING_PLATFORM_PORT'] = config['TRADING_PLATFORM']['port']

        except KeyError as e:
            raise CommandError(f"Invalid database connection information in db_connection.ini: missing key {e}")

        self.stdout.write(self.style.SUCCESS('Database configuration successfully set.'))
