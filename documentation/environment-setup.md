# Running and managing GoldenView locally

## **Creating a virtual environment**
Open terminal as administrator.
Change directory to your project:
```cmd
cd project_Terminal\development
```

To create a virtual environment that runs a specific Python version:

```cmd
python -m venv --python="C:\Users\Username\AppData\Local\Programs\Python\Python311\python.exe" ./venv
```

Or to create a virtual environment that runs the default Python version in your local path:
```cmd
python -m venv ./venv
```


Activate the virtual environment by running the appropriate activate file:
```cmd
 "./venv/Scripts/activate.bat"
```


Make sure to upgrade pip to the latest version (follow pip's instruction in case of ERROR):
```cmd
pip install --upgrade pip
```

## **Adding all requirements**

1. Install the python modules (requirements) needed to run the app locally:

    ```cmd
    pip install -r .\requirements.txt
    ```

2. In case you do not have MySQL installed on your machine, do install it,
you can just install XAMPP to a path with no spaces and it will come with
MySQL.

3. In case you do not have MongoDB installed on your machine, do install it,
you can install from the link below, do not check the box for installing
as a service (you can but it is not neccessary).<br/>
`https://www.mongodb.com/try/download/community`


## **Running the project**

#### **To run the project, you need to do the following steps:**
    Note:
    Steps 6-8 require the terminal window to have admin priviliges.
    Steps 6-8 must be done in the same terminal window.


1. Start the MySQL service on your machine.

2. Setup SQL databases from `development/databases/trading_platform` by running each of their `db_scripts/init.sql` scripts for exampl inside XAMPP.

3. Check if the setup databases match the info inside their corresponding `db_config/db_connection.ini` and update the `.ini` files if that is not the case.

4. Check if NoSQL databases have properly configure MongoDB path on your machin inside their corresponding `db_config/db_connection.ini` files.

5. Create the following files as they are not tracked due to `.gitignore`:
    <br/>
    `GoldenView\development\trading_platform\logs\exec_logs\logs.log`
    `GoldenView\development\trading_platform\logs\mongodb_logs\logs.log`

6. Navigate to the project directory and run the following `configure_db` command (more on it here: `development/trading_platform/deployment/management/commands/README.md`) and copy paste its output into cmd and press Enter to execute the shell/cmd command that it generated:
    ```cmd
    cd .\trading_platform
    python manage.py configure_db
    ``` 
    '...' change for what console tells you to put in after this command above

    ```cmd
    set ...
    ```

7. Run the following to apply all database linking neccessary for current state of project to work:
 ```cmd

    python manage.py showmigrations

    ```
    There should be no erros.

    ```cmd

    python manage.py makemigrations asset_management

    ```

    ```cmd

    python manage.py migrate asset_management

    ```

    Ako javi gresku da neka tabela vec postoji dropuj celu semu, pokreni odgovarajuci init.sql i ponovi sada lepo sve kako pise :)

    ```cmd

    python manage.py makemigrations user_management

    ```

    ```cmd

    python manage.py migrate user_management

    ```

    Ako javi gresku da neka tabela vec postoji dropuj celu semu, pokreni odgovarajuci init.sql i ponovi sada lepo sve kako pise :)

    ```cmd

    python manage.py makemigrations

    ```

    ```cmd

    python manage.py migrate

    ```

8. Run the following to start the server:
    ```cmd
    python manage.py runserver
    ```


## **Adding a new app**

<br/>

#### ***Note***:
    Step 2 requires the terminal window to have admin priviliges.
    The `startapp_structured` management command automates this process.
    Explained in `development/deployment/management/commands/README.md`.

<br/>
To add a new app to the Django project trading_platform:

1. Create the folder where the app will reside:
    ```cmd
    mkdir "./apps/your_app"
    ```

2. Create the app by running the following command:
    ```cmd
    python manage.py startapp your_app apps/your_app
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