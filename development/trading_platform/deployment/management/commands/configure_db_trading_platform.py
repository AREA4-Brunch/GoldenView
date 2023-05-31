from io import StringIO
import os
import configparser
import platform
from typing import Optional

from django.core.management.base import BaseCommand, CommandError
from django.conf import settings

BASE_DIR = settings.BASE_DIR


class Command(BaseCommand):
    help = 'Sets the environment variables for trading_platform database configuration'
    name = 'configure_db_django'

    DEFAULT_DB_CONFIG_PATH = os.path.join(BASE_DIR, "../databases/trading_platform/db_config")

    def add_arguments(self, parser):
        # optional arguments:
        parser.add_argument(
            '-dl', '--do-log-cmd',
            type=int,
            default=True,
            help='Path to folder where mongodb will be storing its data'
        )

        parser.add_argument(
            '-tdcs', '--td-config-src',  # trading_platform config source
            type=str,
            help='Path to folder representing db cofig, must contain db_connection.ini.'
        )

    def handle(self, *args, **options):
        cmd = self.do_work()

        if options.get('do_log_cmd', True):
            self.stdout.write(self.style.SUCCESS('Copy paste the following instruction into the shell/cmd window in which you will run the `python manage.py runserver` command.\n'))
            self.stdout.write(f'{cmd}')

    def do_work(self, *args, **options):
        try:
            config_path = options.pop(
                "td_config_src",
                os.path.join(Command.DEFAULT_DB_CONFIG_PATH, "db_connection.ini")
            )

            config_data = Command.getConfigData(config_path)
            cmd = Command.getSetConfigCmdCommand(config_data)
            return cmd

        except Exception as e:
            self.stdout.write(self.style.ERROR(f"Invalid database connection information in {config_path}: missing key {e}"))
            return ''

    @staticmethod
    def getSetConfigCmdCommand(config_data):
        is_windows = platform.system() == 'Windows'
        cmd = ''
        for env_var_name in config_data:
            env_var_val = config_data[env_var_name]
            if env_var_val.strip() == '': continue;
            # quotes = '"' if ' ' in env_var_val or env_var_val.strip() == '' else ''
            quotes = '"'
            cmd += f'{"set" if is_windows else ""} {quotes}{env_var_name}={env_var_val}{quotes}'
            cmd += ' & ' if is_windows else ' && '
        # remove last ampersand or double ampersand
        if cmd.endswith(' '): cmd = cmd[ : cmd.rfind(' &')];
        return cmd

    @staticmethod
    def getConfigData(config_path: str):
        config_data = {}

        # read the database connection information from the .ini file
        config = configparser.ConfigParser()
        config.read(config_path)

        try:
            # os.environ['DB_TRADING_PLATFORM_NAME'] = config['TRADING_PLATFORM']['name']
            # os.environ['DB_TRADING_PLATFORM_USER'] = config['TRADING_PLATFORM']['user']
            # os.environ['DB_TRADING_PLATFORM_PASSWORD'] = config['TRADING_PLATFORM']['password']
            # os.environ['DB_TRADING_PLATFORM_HOST'] = config['TRADING_PLATFORM']['host']
            # os.environ['DB_TRADING_PLATFORM_PORT'] = config['TRADING_PLATFORM']['port']

            config_data['DB_TRADING_PLATFORM_NAME'] = config['TRADING_PLATFORM']['name']
            config_data['DB_TRADING_PLATFORM_USER'] = config['TRADING_PLATFORM']['user']
            config_data['DB_TRADING_PLATFORM_PASSWORD'] = config['TRADING_PLATFORM']['password']
            config_data['DB_TRADING_PLATFORM_HOST'] = config['TRADING_PLATFORM']['host']
            config_data['DB_TRADING_PLATFORM_PORT'] = config['TRADING_PLATFORM']['port']

        except KeyError as e:            
            raise CommandError(f"Invalid database connection information in {config_path}: missing key {e}")

        finally:
            return config_data
