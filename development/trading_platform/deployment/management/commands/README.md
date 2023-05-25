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

- `-cs` or `--config-src`: [Optional] specifies path to folder that contains db_connection.ini file to be used to setup the db config. Cannot be used with `all`argument.

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

## **configure_db_django**

This command serves as shortcut whose output when pasted into cmd/shell sets the environment variables for the `trading_platform_django_built_in` database configuration.
<br/>

### Usage:
To execute the command:
```cmd
python manage.py configure_db_django [OPTIONS]
```

The command takes the following options:

- `-cs` or `--config-src`: [Optional] specifies path to folder that contains db_connection.ini file to be used to setup the db config. Cannot be used with `all`argument.

<br/>

### Examples:

- To set up the configuration for the Django built in features database using default db_config path:

    ```cmd
    python manage.py configure_db_django
    ```

    and using a custom config folder path that has a db_connection.ini file inside:

    ```cmd
    python manage.py configure_db_django --config-src="../databases/trading_platform_django_built_in/db_config"
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