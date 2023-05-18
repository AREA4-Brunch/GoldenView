""" Django AppDirectoriesFinder extended to locate the
    static folders within apps.
"""

from django.contrib.staticfiles.finders import AppDirectoriesFinder

from django.conf import settings
DEFAULT_APP_STATICFILES_DIR = settings.DEFAULT_APP_STATICFILES_DIR


class StaticAppDirectoriesFinder(AppDirectoriesFinder):
    def find(self, path, all=False):
        # try with the default search for my_app/static/
        result = super().find(path, all=all)

        # process only static/ folder lookups
        if not result and path.startswith('static/'):
            path = path.replace('static/', DEFAULT_APP_STATICFILES_DIR)
            result = super().find(path, all=all)

        return result
