""" Django loaders.Loader extended to locate the
    template folders within apps.
"""

from django.template.loaders.app_directories import Loader
from django.template.utils import get_app_template_dirs


class TemplateViewAppLoader(Loader):
    def get_dirs(self):
        return get_app_template_dirs("frontend/src/templates")
