import platform

from django.core.management import call_command
from django.core.management.base import BaseCommand

from .configure_db_trading_history import Command as ConfigTradingHistoryCommand
from .configure_db_trading_platform import Command as ConfigTradingPlatformCommand


class Command(BaseCommand):
    help = 'Sets the environment variables for the database(s) default configurations.'
    name = 'configure_db'

    def handle(self, *args, **options):
        options['do_log_cmd'] = False  # subcommands will not log
        is_windows = platform.system() == 'Windows'
        cmd = self._setupTradingHistoryDatabase(*args, **options)
        if cmd != '': cmd += ' & ' if is_windows else ' && ';
        cmd += self._setupTradingPlatformDatabase(*args, **options)
        # remove last ampersand or double ampersand
        if cmd.endswith(' '): cmd = cmd[ : cmd.rfind(' &')];

        self.stdout.write(self.style.SUCCESS('Copy paste the following instruction into the shell/cmd window'))
        self.stdout.write(self.style.SUCCESS(' in which you will run the `python manage.py runserver` command.\n'))
        self.stdout.write(f'{cmd}')

    def _setupTradingHistoryDatabase(self, *args, **options):
        cmd = ConfigTradingHistoryCommand().do_work(*args, **options)
        return cmd

    def _setupTradingPlatformDatabase(self, *args, **options):
        cmd = ConfigTradingPlatformCommand().do_work(*args, **options)
        return cmd
