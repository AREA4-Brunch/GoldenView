import os
import configparser
import platform

from django.core.management.base import BaseCommand, CommandError
from django.conf import settings

BASE_DIR = settings.BASE_DIR


class Command(BaseCommand):
    help = 'Sets the environment variables for the database(s) configuration'
    name = 'configure_db_django'

    DEFAULT_DB_CONFIG_PATH = os.path.join(BASE_DIR, "../databases/trading_platform/db_config")

    def add_arguments(self, parser):
        # optional arguments:
        parser.add_argument(
            '-cs', '--config-src',
            type=str,
            help='Path to folder representing db cofig, must contain db_connection.ini.'
        )

    def handle(self, *args, **options):
        cmd = Command.getSetConfigCmdCommand(options)
        self.stdout.write(self.style.SUCCESS('Copy paste the following instruction into the shell/cmd window in which you will run the `python manage.py runserver` command.\n'))
        self.stdout.write(f'{cmd}')

    @staticmethod
    def getSetConfigCmdCommand(options: dict[str]):
        is_windows = platform.system() == 'Windows'
        cmd = ''
        for (env_var_name, env_var_val) in Command.getConfigData(options):
            if env_var_val.strip() == '': continue;
            # quotes = '"' if ' ' in env_var_val or env_var_val.strip() == '' else ''
            quotes = '"'
            cmd += f'{"set" if is_windows else ""} {quotes}{env_var_name}={env_var_val}{quotes}'
            cmd += ' & ' if is_windows else ' && '
        # remove last ampersand or double ampersand
        if cmd.endswith(' '): cmd = cmd[ : cmd.rfind(' &')];
        return cmd

    @staticmethod
    def getConfigData(options: dict[str]):
        # setup default config files path if not provided
        config_path = options.get(
            "config_src",
            os.path.join(Command.DEFAULT_DB_CONFIG_PATH, "db_connection.ini")
        )

        # read the database connection information from the .ini file
        config = configparser.ConfigParser()
        config.read(config_path)

        try:
            # os.environ['DB_TRADING_PLATFORM_NAME'] = config['TRADING_PLATFORM']['name']
            # os.environ['DB_TRADING_PLATFORM_USER'] = config['TRADING_PLATFORM']['user']
            # os.environ['DB_TRADING_PLATFORM_PASSWORD'] = config['TRADING_PLATFORM']['password']
            # os.environ['DB_TRADING_PLATFORM_HOST'] = config['TRADING_PLATFORM']['host']
            # os.environ['DB_TRADING_PLATFORM_PORT'] = config['TRADING_PLATFORM']['port']

            yield ('DB_TRADING_PLATFORM_NAME', config['TRADING_PLATFORM']['name'])
            yield ('DB_TRADING_PLATFORM_USER', config['TRADING_PLATFORM']['user'])
            yield ('DB_TRADING_PLATFORM_PASSWORD', config['TRADING_PLATFORM']['password'])
            yield ('DB_TRADING_PLATFORM_HOST', config['TRADING_PLATFORM']['host'])
            yield ('DB_TRADING_PLATFORM_PORT', config['TRADING_PLATFORM']['port'])
        except KeyError as e:
            raise CommandError(f"Invalid database connection information in {config_path}: missing key {e}")
