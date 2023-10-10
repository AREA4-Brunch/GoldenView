from django.core.management.base import BaseCommand

from apps.asset_management.models import (
    AssetStats,
    AssetTransaction,
    CarriedOutPurchaseTradeRequest,
    CarriedOutSalesTradeRequest,
)


class Command(BaseCommand):
    help = "Creates empty trading_history db and tables if they do not exist"
    name = 'migrate_trading_history'

    def handle(self, *args, **options):
        models = [
            AssetStats,
            AssetTransaction,
            CarriedOutPurchaseTradeRequest,
            CarriedOutSalesTradeRequest,
        ]

        # create the tables that don't yet exist
        for model in models:
            if not model._get_collection().name:
                self.stdout.write(f'Creating non existant table: {model}')
                model.ensure_indexes()

        self.stdout.write(self.style.SUCCESS('All trading_history db models have their tables created.'))
