class AppDataRouter:
    def db_for_read(self, model, **hints):
        if not model._meta.app_label.startswith('django.contrib'):
            return 'trading_platform'
        return None

    def db_for_write(self, model, **hints):
        if not model._meta.app_label.startswith('django.contrib'):
            return 'trading_platform'
        return None

    def allow_relation(self, obj1, obj2, **hints):
        return None

    def allow_migrate(self, db, app_label, model_name=None, **hints):
        if not app_label.startswith('django.contrib'):
            return db == 'trading_platform'
        return None
