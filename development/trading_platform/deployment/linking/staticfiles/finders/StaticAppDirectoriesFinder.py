""" Django AppDirectoriesFinder extended to locate the
    static folders within apps.
"""

from django.contrib.staticfiles.finders import AppDirectoriesFinder

from django.conf import settings
DEFAULT_APP_STATICFILES_DIR = settings.DEFAULT_APP_STATICFILES_DIR


class StaticAppDirectoriesFinder(AppDirectoriesFinder):
    """
    A static files finder that looks in the directory of each app as
    specified in the source_dir attribute.
    """

    source_dir = DEFAULT_APP_STATICFILES_DIR
