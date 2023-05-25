import platform

# from django.core.management import call_command
from django.core.management.base import BaseCommand, CommandError

from .configure_db_django import Command as ConfigDjangoCommand
from .configure_db_trading_platform import Command as ConfigTradingPlatformCommand


class Command(BaseCommand):
    help = 'Sets the environment variables for the database(s) default configurations.'
    name = 'configure_db'

    def handle(self, *args, **options):
        # self._setupTradingPlatformDatabase()
        # self._setupTradingHistoryDatabase()
        is_windows = platform.system() == 'Windows'
        cmd = self._setupDjangoBuiltInDatabase(options)
        cmd += ' & ' if is_windows else ' && '
        cmd += self._setupTradingPlatformDatabase(options)
        # remove last ampersand or double ampersand
        if cmd.endswith(' '): cmd = cmd[ : cmd.rfind(' &')];

        self.stdout.write(self.style.SUCCESS('Copy paste the following instruction into the shell/cmd window in which you will run the `python manage.py runserver` command.\n'))
        self.stdout.write(f'{cmd}')

    def _setupDjangoBuiltInDatabase(self, options: dict[str]):
        # call_command("configure_db_django")
        cmd = ConfigDjangoCommand.getSetConfigCmdCommand(options)
        return cmd

    def _setupTradingPlatformDatabase(self, options: dict[str]):
        # call_command("configure_db_trading_platform")
        cmd = ConfigTradingPlatformCommand.getSetConfigCmdCommand(options)
        return cmd

    def _setupTradingHistoryDatabase(self, options: dict[str]):
        # TODO
        return ''
