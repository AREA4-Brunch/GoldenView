import os

from django.core.management.commands.startapp import Command as StartAppCommand
from django.conf import settings

BASE_DIR = settings.BASE_DIR
PATH_PROJECT_SETTINGS = os.path.join(BASE_DIR, 'trading_platform', 'settings.py')

class Command(StartAppCommand):
    help = "Custom startapp command that enforces certain project structure."
    name = 'startapp_structured'

    def handle(self, **options):
        app_name:str = options.pop("name")
        target:str = options.pop("directory", None)

        if target is None:
            if not app_name.startswith('apps/'):
                target = f'apps/{app_name}'
            else:
                target = app_name
                app_name = app_name.replace('apps/', '', 1)

        options.update({ 'name': app_name })
        options.update({ 'directory': target })

        os.makedirs(target, exist_ok=False)

        super().handle(**options)
        self.stdout.write(self.style.SUCCESS('Created an app. Setting up the project structure..'))

        Command.createProjectStructure(target, app_name)

        self.registerAsInstalledApp(target, app_name)
        self.stdout.write(self.style.SUCCESS('Finished creating and structuring an app :)'))

    @staticmethod
    def createProjectStructure(base_directory, app_name):
        # Create top-level files
        top_level_files = [
            'admin.py',
            'apps.py',
            'models.py',
            'tests.py',
            'urls.py',
            'views.py',
            '__init__.py'
        ]

        for file in top_level_files:
            file_path = os.path.join(base_directory, file)
            if not os.path.exists(file_path):
                with open(file_path, 'w'):
                    pass

        def createFile(file_path):
            file_path = os.path.join(base_directory, file_path)
            os.makedirs(os.path.dirname(file_path), exist_ok=True)
            with open(file_path, 'w'):
                pass

        createFile('backend/libs/.gitkeep')
        createFile('backend/src/models/.gitkeep')
        createFile('backend/src/utils/.gitkeep')
        createFile('frontend/config/config.json')
        createFile('frontend/src/components/buttons/.gitkeep')
        createFile('frontend/src/templates/footer/.gitkeep')
        createFile(f'frontend/src/static/{app_name}/css/.gitkeep')
        createFile(f'frontend/src/static/{app_name}/images/.gitkeep')
        createFile(f'frontend/src/static/{app_name}/js/.gitkeep')
        createFile(f'frontend/src/static/{app_name}/libs/.gitkeep')
        createFile(f'frontend/src/static/{app_name}/favicon.ico')
        createFile(f'frontend/src/static/{app_name}/robots.txt')

    def registerAsInstalledApp(self, base_directory, app_name):
        # Modify settings.py
        settings_path = PATH_PROJECT_SETTINGS
        with open(settings_path, 'r') as f:
            settings_lines = f.readlines()

        installed_apps_index = -1
        for i in range(len(settings_lines)):
            if settings_lines[i].startswith('INSTALLED_APPS = ['):
                installed_apps_index = i
                break

        # Modify apps.py
        apps_path = os.path.join(base_directory, 'apps.py')
        with open(apps_path, 'r') as f:
            apps_lines = f.readlines()

        # Get name of config class
        class_idx = -1
        for i, line in enumerate(apps_lines):
            if line.startswith('class '):
                class_idx = i
                break

        class_name = apps_lines[class_idx][apps_lines[class_idx].find('class ') + len('class ')
                                         : apps_lines[class_idx].find('(AppConfig')]

        # Add to installed apps
        insert_idx = -1
        for i in range(installed_apps_index, len(settings_lines)):
            if settings_lines[i].strip().find(']') != -1:
                insert_idx = i
                break

        app_root = base_directory.replace('/', '.')
        app_installed_txt = settings_lines[insert_idx - 1][ : settings_lines[insert_idx - 1].find("'")] \
                          + f"'{app_root}.apps.{class_name}',\n"
        settings_lines.insert(insert_idx, app_installed_txt)

        with open(settings_path, 'w') as f:
            f.writelines(settings_lines)

        self.stdout.write(self.style.SUCCESS(f"Appended `{app_root}` to INSTALLED_APPS in settings.py"))

        # Modify the name of the config class
        idx = -1
        for i, line in enumerate(apps_lines):
            if line.strip().startswith('name'):
                idx = i
                break
        apps_lines[idx] = apps_lines[idx][ : apps_lines[idx].find('name')] \
                        + f"name = '{app_root}'"

        with open(apps_path, 'w') as f:
            f.writelines(apps_lines)

        self.stdout.write(self.style.SUCCESS(f"Updated app config name to `{app_root}` in `{app_root}.apps.{class_name}.py`"))

        return
