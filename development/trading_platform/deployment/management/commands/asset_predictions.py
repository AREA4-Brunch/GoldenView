import subprocess

from django.utils import timezone
from django.core.management.base import BaseCommand

from apps.asset_management.backend.src.utils.asset_predictions import upsert_asset_values_predictions, \
                                                                      generate_asset_values_predictions

class Command(BaseCommand):
    help = "Generates asset prediction for given asset"
    name = 'asset_predictions'

    def add_arguments(self, parser):
        parser.add_argument('id_asset', type=int, help='id of the asset')

    def handle(self, *args, **options):
        id_asset = options['id_asset']
        # tomorrow as start day
        start_day = timezone.now() + timezone.timedelta(days=1)
        upsert_asset_values_predictions(id_asset, start_day,
            generate_asset_values_predictions(id_asset, start_day, 10)
        )
