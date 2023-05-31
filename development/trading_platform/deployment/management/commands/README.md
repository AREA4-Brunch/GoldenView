# Management Command
Commands represent scripts that automate tasks, for example updating the
assets values predictions once a day.

Commands are to be run as:
```cmd
python manage.py <command_name>
```
<br/>

# Available commands:



## **configure_db**

This command serves as shortcut whose output when pasted into cmd/shell sets the environment variables for all the databases configurations by calling all configure_db_* commands instead of the user calling each one individually. Takes no args and relies on default configuration folder paths of the commands.

Must be run before starting a server for changes to take place. Needed to be run once per shell/cmd session as the environment variables are tied only to a specific session.

<br/>

### Usage:
To execute the command:
```cmd
python manage.py configure_db
```

<br/>

## **configure_db_trading_platform**

This command serves as shortcut whose output when pasted into cmd/shell sets the environment variables for the Trading Platform database configuration.
<br/>

### Usage:
To execute the command:
```cmd
python manage.py configure_db_trading_platform [OPTIONS]
```

The command takes the following options:

- `-cs` or `--config-src`: [Optional] Specifies path to folder that contains db_connection.ini file to be used to setup the db config. Cannot be used with `all`argument.

<br/>

### Examples:

- To set up the configuration for the Trading Platform database using default db_config path:

    ```cmd
    python manage.py configure_db_trading_platform
    ```

    and using a custom config folder path that has a db_connection.ini file inside:

    ```cmd
    python manage.py configure_db_trading_platform --config-src="../databases/trading_platform/db_config"
    ```

<br/>

## **configure_db_trading_history**

This command serves as shortcut whose output when pasted into cmd/shell sets the environment variables for the `trading_history` database configuration.
<br/>

### Usage:
To execute the command:
```cmd
python manage.py configure_db_trading_history [OPTIONS]
```

The command takes the following options:

- `-dl` or `--do-log-cmd`: [Optional] Specifies whether to log the generated command. By default, the command is logged. This can only be useful when programatically calling the command.
- `-thcs` or `--th-config-src`: [Optional] Specifies the path to the folder representing the database configuration. The folder must contain the `db_connection.ini` file. Default path is: `../databases/trading_history/db_config`.
- `-dp` or `--dbpath`: [Optional] Specifies the path to the folder where MongoDB will store its data. Default is first looked for in `{th-config-src}/db_connection.ini` of the `th-config-src` and only if it is not set there is then set to `../databases/trading_history/mongodb_data`.
- `-lp` or `--logpath`: [Optional] Specifies the path to the file where MongoDB will store its logs. Default is first looked for in `{th-config-src}/db_connection.ini` of the `th-config-src` and only if it is not set there is then set to `./logs/mongodb_logs/logs.log`.
- `-host` or `--host`: [Optional] Specifies the host for the MongoDB instance. Default is first looked for in `{th-config-src}/db_connection.ini` of the `th-config-src` and only if it is not set there is then set to `127.0.0.1`.
- `-p` or `--port`: [Optional] Specifies the port for the MongoDB instance. Default is first looked for in `{th-config-src}/db_connection.ini` of the `` and only if it is not set there is then set to `27017`.

<br/>

### Examples:

- To set up the configuration for the Django built in features database using default db_config path:

    ```cmd
    python manage.py configure_db_trading_history
    ```

    and using a custom config folder path that has a db_connection.ini file inside:

    ```cmd
    python manage.py configure_db_trading_history --th-config-src="../databases/trading_history/db_config"
    ```

<br/>

## **startapp_structured**

This command extends the Django `startapp` functionality by creating more
project files within the app distributed across backend and frontend folders. Also adds the app into `INSTALLED_APPS` in `settings.py`.

<br/>

### Usage:
To execute the command (Must be called from project lvl folder, look at examples):
```cmd
python manage.py startapp_structured [OPTIONS]
```

The command takes the following options:

- first arg: Name of the app to be created.
- second arg: [Optional] Path for the app to be created in, if provided then name
                         must too be provided. If not provided, the default is
                         the `apps` folder of the project.

<br/>

### Examples:

- Providing just a name:

    ```cmd
    D:\GoldenView\development\trading_platform> python manage.py startapp_structured broker_app
    ```

- Providing both name and path (Custom paths should be used only in special cases):

    ```cmd
    D:\GoldenView\development\trading_platform> python manage.py startapp_structured broker_app apps/broker_app
    ```