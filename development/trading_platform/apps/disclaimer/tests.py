import unittest
from django.contrib.auth import get_user_model
from django.shortcuts import reverse
from django.test import Client, TestCase
from apps.user_management.models import User, Trader, Country
from apps.disclaimer import views


class Tests(TestCase):
    def setUp(self):
        self.client = Client()
        User = get_user_model()
        self.user = User.objects.create_user(username='testiranje2', password='Testiranje123!', email='testiranje2@gmail.com')
        self.country = Country.objects.create(name='Test')
        self.trader = Trader.objects.create(idtrader=self.user, birthday='2001-01-01', idcountry=self.country)

    def test_accept_terms_success(self):
        self.client.force_login(self.user)
        response = self.client.post(reverse('accept_terms_form'))

        self.assertEqual(response.status_code, 302)
        self.assertRedirects(response, reverse('home'))

        trader = Trader.objects.get(idtrader=self.user)
        self.assertTrue(views.did_accept_terms(trader))

    def test_accept_terms_not_trader(self):
        User = get_user_model()
        user = User.objects.create_user(username='testiranje3', password='Testiranje123!', email='testiranje3@gmail.com')
        self.client.force_login(user)
        response = self.client.post(reverse('accept_terms_form'))

        self.assertEqual(response.status_code, 302)
        self.assertRedirects(response, reverse('disclaimer_page'))

        trader = Trader.objects.filter(idtrader=user).first()
        self.assertIsNone(trader)
        self.assertEqual(response.wsgi_request.session['internal_err'], 'These terms are meant only for Trader type of users.')


if __name__ == '__main__':
    unittest.main()
