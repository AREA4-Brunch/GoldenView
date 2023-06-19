from django.test import TestCase, Client
from django.urls import reverse
from .views import *
from .models import *

# Create your tests here.

class TestViews(TestCase):

    def setUp(self):
        self.client = Client()
        self.list_url = reverse('home')

    def test_view_home(self):
        response = self.client.get(self.list_url)
        self.assertEquals(response.status_code, 200)
        self.assertTemplateUsed(response, 'website/landing_page/landing_page.html')