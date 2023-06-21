from datetime import date
from django.test import TestCase, Client
from django.urls import reverse
from apps.file_management.models import ApprovalReportFile, BrokerRequestFile, TextFile
from apps.user_management.models import *
from apps.administrator_dashboard.views import *

#create your tests here
class AdministratorDashboardTests(TestCase):
    def setUp(self):
        self.client = Client()

        self.country = Country.objects.create()

        self.user = User(username='admin', password='admin123', email='admin@gmail.com')
        self.user.save()

        self.admin = User(username='admin_user', password='admin123', email='admin123@gmail.com')
        self.admin.is_staff=True
        self.admin.save()

        self.trader1 = User(username='trader_user1', password='trader123', email='trader_user@gmail.com')
        self.trader1.save()

        self.trader2 = User(username='trader_user2', password='trader1234', email='trader_user1@gmail.com')
        self.trader2.save()

        self.broker = User(username='broker_user', password='broker123', email='broker_user@gmail.com')
        self.trader2.save()

        self.trader_object1 = Trader()
        self.trader_object1.idtrader = self.trader1
        self.trader_object1.birthday = date(1990, 1, 1)
        self.trader_object1.idcountry = self.country
        self.trader_object1.save()

        self.broker_object = Broker()
        self.broker_object.idbroker = self.trader_object1
        self.broker_object.save()

        self.trader_object2 = Trader()
        self.trader_object2.idtrader = self.trader2
        self.trader_object2.birthday = date(1990, 1, 1)
        self.trader_object2.idcountry = self.country
        self.trader_object2.save()

        self.client.login(username='admin', password='admin123')

    def test_administrator_dashboard(self):
        response = self.client.get(reverse('administrator_dashboard_form'))
        self.assertEqual(response.status_code, 302)
        
    def test_administrator_dashboard_request_approve_form(self):
        request_file = BrokerRequestFile()
        text = TextFile()
        text.filepath = 'file/path'
        #text.save()

        request_file.filepath = text
        #request_file.save()

        response = self.client.post(reverse('administrator_dashboard_form'), {'username': 'trader_user1'})
        self.assertEqual(response.status_code, 302)  # Redirect
        self.assertFalse(BrokerRequestFile.objects.filter(filepath='file/path').exists())

    def test_administrator_dashboard_request_approve_form(self):
        request_file = BrokerRequestFile()
        text = TextFile()
        text.filepath = 'file/path/trader_user1'
        
        request_file.filepath = text
        request_file.user = self.trader1
        
        response = self.client.post(reverse('administrator_dashboard_request_approve_form'), {'filepath': 'file/path/trader_user1'})
        self.assertEqual(response.status_code, 302)  # Redirect
        self.assertFalse(BrokerRequestFile.objects.filter(filepath='file/path/trader_user1').exists())
        self.assertTrue(Broker.objects.filter(idbroker=self.trader_object1).exists())

    def test_administrator_dashboard_request_delete_form(self):
        request_file = BrokerRequestFile()
        text = TextFile()
        text.filepath = 'file/path/trader_user1'
        
        request_file.filepath = text
        request_file.user = self.trader1
        
        response = self.client.post(reverse('administrator_dashboard_request_delete_form'), {'filepath': 'file/path/trader_user1'})
        self.assertEqual(response.status_code, 302)  # Redirect
        self.assertFalse(BrokerRequestFile.objects.filter(filepath='file/path/trader_user1').exists())

    def test_adminlogout(self):
        response = self.client.get(reverse('adminlogout'))
        self.assertEqual(response.status_code, 302)  # Redirect
        

