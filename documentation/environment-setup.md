# Running and managing GoldenView locally

## **Creating a virtual environment**

To create a virtual environment that runs a specific Python version:

```cmd
D:\GoldenView\development> python -m venv --python="C:\Users\Username\AppData\Local\Programs\Python\Python311\python.exe" ./venv
```

Or to create a virtual environment that runs the default Python version in your local path:
```cmd
D:\GoldenView\development> python -m venv ./venv
```


Activate the virtual environment by running the appropriate activate file:
```cmd
D:\GoldenView\development> "./venv/Scripts/activate"
```


Make sure to upgrade pip to the latest version:
```cmd
(venv) D:\GoldenView\development> pip install --upgrade pip
```

## **Adding all requirements**

Install all the requirements needed to run the app locally:

```cmd
(venv) D:\GoldenView\development> pip install -r .\requirements.txt
```

## **Running the project**

To run the project, you need to do the following:

1. Setup SQL databases from `development/databases` by running each of their `db_scripts/init.sql` scripts inside XAMPP for example.

2. Check if the setup databases match the info inside their corresponding `db_config/db_connection.ini` and update the `.ini` file if that is not the case.

3. Navigate to the project directory and run the following `config_db` command (more on it here: `development/deployment/management/commands/README.md`) and copy paste its output into cmd and press Enter to execute the shell/cmd command that it generated:
    ```cmd
    (venv) D:\GoldenView\development\trading_platform> python manage.py config_db
    ```

    ```cmd
    (venv) D:\GoldenView\development\trading_platform> set ...
    ```

4. Run the following to apply all database linking neccessary for current state of project to work:
    ```cmd
    (venv) D:\GoldenView\development\trading_platform> python manage.py showmigrations
    ```

    There should be no erros.

    ```cmd
    (venv) D:\GoldenView\development\trading_platform> python manage.py makemigrations
    ```

    ```cmd
    (venv) D:\GoldenView\development\trading_platform> python manage.py migrate
    ```

5. Run the following to start the server:
    ```cmd
    (venv) D:\GoldenView\development\trading_platform> python manage.py runserver
    ```


## **Adding a new app**

<br/>

#### ***Note***:
    The `startapp_structured` management command automates this process.
    Explained in `development/deployment/management/commands/README.md`.

<br/>
To add a new app to the Django project trading_platform:

1. Create the folder where the app will reside:
    ```cmd
    D:\GoldenView\development\trading_platform> mkdir "./apps/your_app"
    ```

2. Create the app by running the following command:
    ```cmd
    (venv) D:\GoldenView\development\trading_platform> python manage.py startapp your_app apps/your_app
    ```

3. Go to the `trading_platform/apps/your_app/apps.py` file and change the `name` attribute of the `YourAppConfig` class from `your_app` to `apps.your_app`.

    ```py
    from django.apps import AppConfig


    class YourAppConfig(AppConfig):
        default_auto_field = 'django.db.models.BigAutoField'
        name = 'apps.your_app'

    ```

4. Add 'apps.your_app.apps.YourAppConfig' to the `INSTALLED_APPS` list in `trading_platform/trading_platform/settings.py`.

    ```py
    INSTALLED_APPS = [
        'django.contrib.admin',
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.messages',
        'django.contrib.staticfiles',

        (...)  # other apps added
        'apps.your_app.apps.YourAppConfig',  # append your app
    ]
    ```
