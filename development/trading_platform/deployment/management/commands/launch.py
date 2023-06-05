import subprocess

from django.core.management import call_command
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    help = "Calls `runserver` and the `background_task` `process_tasks` manage.py cmnds"
    name = 'launch'

    def handle(self, *args, **options):
        # running as subprocess makes sure itinherits the env
        # variables set by the configure_db command
        subprocess.Popen(['start', 'cmd', '/K', 'python', 'manage.py', 'process_tasks'], shell=True)
        cmd = 'cmd /K timeout /t 2 && python manage.py runserver'
        subprocess.Popen(cmd)
