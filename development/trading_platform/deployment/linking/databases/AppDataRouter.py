"""
    NOT USED. Could be reused if cofiguring multiple database
    instead of having single 'default' database.
"""

class AppDataRouter:
    def db_for_read(self, model, **hints):
        if model._meta.app_label.startswith('django.contrib'):
            return 'default'
        return 'trading_platform'
        # return None

    def db_for_write(self, model, **hints):
        if model._meta.app_label.startswith('django.contrib'):
            return 'default'
        return 'trading_platform'
        # return None

    def allow_relation(self, obj1, obj2, **hints):
        return True
        # return None

    def allow_migrate(self, db, app_label, model_name=None, **hints):
        if not app_label.startswith('django.contrib'):
            if db == 'trading_platform':
                return True
            return None # indicate setting was not setup
        return db == 'default'
