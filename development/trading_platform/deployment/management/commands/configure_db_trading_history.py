import os
import configparser
import platform
import subprocess
import time

from pymongo import MongoClient
from pymongo.errors import ConnectionFailure

from django.core.management import call_command
from django.core.management.base import BaseCommand, CommandError

from django.conf import settings


BASE_DIR = settings.BASE_DIR


class Command(BaseCommand):
    help = 'Sets the environment variables for trading_history database configuration'
    name = 'configure_db_trading_history'

    DEFAULT_DB_CONFIG_PATH = os.path.join(BASE_DIR, "../databases/trading_history/db_config")

    def add_arguments(self, parser):
        # optional arguments:
        parser.add_argument(
            '-dl', '--do-log-cmd',
            type=int,
            default=True,
            help='Path to folder where mongodb will be storing its data'
        )

        parser.add_argument(
            '-thcs', '--th-config-src',  # trading_history config source
            type=str,
            help='Path to folder representing db cofig, must contain db_connection.ini.'
        )

        parser.add_argument(
            '-dp', '--dbpath',
            type=str,
            help='Path to folder where mongodb will be storing its data'
        )

        parser.add_argument(
            '-lp', '--logpath',
            type=str,
            help='Path to file where mongodb will be storing its logs'
        )

        parser.add_argument(
            '-host', '--host',
            type=str,
            help='Host for the mongodb instance.'
        )

        parser.add_argument(
            '-p', '--port',
            type=int,
            help='Port for the mongodb instance.'
        )

    def handle(self, *args, **options):
        cmd = self.do_work()

        if options.get('do_log_cmd', True):
            self.stdout.write(self.style.SUCCESS('Copy paste the following instruction into the shell/cmd window in which you will run the `python manage.py runserver` command.\n'))
            self.stdout.write(f'{cmd}')

    def do_work(self, *args, **options):
        try:
            config_path = options.pop(
                "th_config_src",
                os.path.join(Command.DEFAULT_DB_CONFIG_PATH, "db_connection.ini")
            )
            config_data = Command.getConfigData(config_path)

            did_succeed = self.startMongoDB(*self.getStartMongoArgs(config_data, **options))
            if not did_succeed:
                return ''

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
            env_var_val = str(config_data[env_var_name])
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
            # os.environ['DB_TRADING_HISTORY_NAME'] = config['TRADING_HISTORY']['name']
            # os.environ['DB_TRADING_HISTORY_USER'] = config['TRADING_HISTORY']['user']
            # os.environ['DB_TRADING_HISTORY_PASSWORD'] = config['TRADING_HISTORY']['password']
            # os.environ['DB_TRADING_HISTORY_HOST'] = config['TRADING_HISTORY']['host']
            # os.environ['DB_TRADING_HISTORY_PORT'] = config['TRADING_HISTORY']['port']

            config_data['MONGODB_SERVICE_PATH'] = config['MONGODB_SERVICE']['mongodb_path']
            config_data['MONGODB_SERVICE_DB_DATA_PATH'] = config['MONGODB_SERVICE']['mongodb_database_data_path']
            config_data['MONGODB_SERVICE_LOGS_PATH'] = config['MONGODB_SERVICE']['mongodb_logs_file_path']

            config_data['DB_TRADING_HISTORY_NAME'] = config['TRADING_HISTORY']['name']
            config_data['DB_TRADING_HISTORY_USERNAME'] = config['TRADING_HISTORY']['username']
            config_data['DB_TRADING_HISTORY_PASSWORD'] = config['TRADING_HISTORY']['password']
            config_data['DB_TRADING_HISTORY_HOST'] = config['TRADING_HISTORY']['host']
            config_data['DB_TRADING_HISTORY_PORT'] = int(config['TRADING_HISTORY']['port'])

        except KeyError as e:
            raise CommandError(f"Invalid database connection information in {config_path}: missing key {e}")

        finally:
            return config_data

    def startMongoDB(self, data_path: str, log_path: str, host: str, port: int):
        # wait for mongo to start
        client = MongoClient(host, port)

        try:  # Check if MongoDB is already running
            self.stdout.write(self.style.WARNING('Checking if there is a MongoDB instance running...\n'))
            if self.isMongoDBRunning(client, 1, 'Checking if there is a MongoDB instance running...'):
                self.stdout.write(self.style.SUCCESS('Detected that MongoDB is already running.'))
                return True

            # start MongoDB server as it was not running already
            mongo_path = os.environ['MONGODB_SERVICE_PATH']
            self.stdout.write(self.style.WARNING(f'Starting the MongoDB found at path:\n"{mongo_path}"\n\n'))
            is_windows = platform.system() == 'Windows'
            if is_windows:
                # cmd = 'start cmd /K "timeout /t 5 && '
                # cmd += f'\"{mongo_path}\" --port {port} --bind_ip {host} --dbpath \"{data_path}\" --logpath \"{log_path}\""'
                cmd = f'start cmd /K "\"{mongo_path}\" --port {port} --bind_ip {host} --dbpath \"{data_path}\" --logpath \"{log_path}\""'
            else:
                cmd += f'xterm -e \'"{mongo_path}" --port {port} --bind_ip {host} --dbpath "{data_path}" --logpath "{log_path}"\''

            subprocess.Popen(cmd, shell=True)

            if not self.isMongoDBRunning(client, 4, 'Waiting for MongoDB to start...'):
                raise Exception('Timeout :( It did not connect after 4 tries')

            self.stdout.write(self.style.SUCCESS('MongoDB server started successfully.'))
            return True

        except KeyError as e:
            self.stdout.write(self.style.ERROR('Failed to start the MongoDB, environment variable `MONGODB_SERVICE_PATH` was not set.'))
            self.stdout.write(self.style.ERROR('Please either start the MongoDB manually or set the `MONGODB_SERVICE_PATH` for which'), ending='')
            self.stdout.write(self.style.ERROR(f' you can use the `configure_db` command, read more about it here: {settings.READ_MNGMNT_CMNDS_DOCS_MSG}\n'))

        except Exception as e:
            self.stdout.write(self.style.ERROR(f'Oops an error occurred:\n{e}\n'))
            self.stdout.write(self.style.ERROR('MongoDB is not currently running on set host and port, you have to start it manually from cmd/shell'), ending='')
            self.stdout.write(self.style.ERROR(' with admin priviliges, the command to run is:'))
            self.stdout.write(f'{cmd}')

        return False

    def isMongoDBRunning(self, client, num_checks=2, msg=''):
        for _ in range(num_checks):
            try:
                client.admin.command('ismaster')  # just ping
                return True
            except ConnectionFailure:
                self.stdout.write(self.style.WARNING(msg))
                time.sleep(1)

        return False

    def getStartMongoArgs(self, config_data, **options):
        default_data_path = '../databases/trading_history/mongodb_data' \
                            if config_data["MONGODB_SERVICE_DB_DATA_PATH"].strip() == '' \
                            else config_data["MONGODB_SERVICE_DB_DATA_PATH"]

        default_logs_path = './logs/mongodb_logs/logs.log' \
                            if config_data["MONGODB_SERVICE_LOGS_PATH"].strip() == '' \
                            else config_data["MONGODB_SERVICE_LOGS_PATH"]

        default_host = config_data.get('DB_TRADING_HISTORY_HOST', '127.0.0.1')
        default_port: int = config_data.get('DB_TRADING_HISTORY_PORT', 27017)

        data_path = options.pop('dbpath', default_data_path)
        log_path = options.pop('logpath', default_logs_path)
        host = options.pop('host', default_host)
        port: int = options.pop('port', default_port)

        return (data_path, log_path, host, port)
