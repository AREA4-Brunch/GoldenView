import unittest

from django.test import Client, TestCase
from django.contrib.auth import get_user_model
from django.shortcuts import reverse


class Tests(TestCase):
    def setUp(self):
        self.client = Client()
        User = get_user_model()
        self.user = User.objects.create_user(
            username='testiranje2',
            password='Testiranje123!',
            email='testiranje2@example.com'
        )
        self.client.force_login(self.user)

    def test_password_reset_success(self):
        response = self.client.post(reverse('password_reset_form'), {
            'old': 'Testiranje123!',
            'new': 'Testiranje123!!'
        })
        self.assertEqual(response.status_code, 302)

        updated_user = get_user_model().objects.get(username='testiranje2')
        self.assertTrue(updated_user.check_password('Testiranje123!!'))

    def test_password_reset_invalid_short(self):
        response = self.client.post(reverse('password_reset_form'), {
            'old': 'Testiranje123!',
            'new': 'Test1!'
        })
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'password_reset.html')
        self.assertContains(response, 'Your password must contain at least 8 characters.')

        updated_user = get_user_model().objects.get(username='testiranje2')
        self.assertTrue(updated_user.check_password('Testiranje123!'))

    def test_password_reset_form_invalid_no_uppercase(self):
        response = self.client.post(reverse('password_reset_form'), {
            'old': 'Testiranje123!',
            'new': 'test123!'
        })
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'password_reset.html')

        updated_user = get_user_model().objects.get(username='testiranje2')
        self.assertTrue(updated_user.check_password('Testiranje123!'))

    def test_password_reset_form_invalid_no_lowercase(self):
        response = self.client.post(reverse('password_reset_form'), {
            'old': 'Testiranje123!',
            'new': 'TEST123!'
        })
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'password_reset.html')

        updated_user = get_user_model().objects.get(username='testiranje2')
        self.assertTrue(updated_user.check_password('Testiranje123!'))

    def test_password_reset_form_invalid_no_digits(self):
        response = self.client.post(reverse('password_reset_form'), {
            'old': 'Testiranje123!',
            'new': 'TestTTT!'
        })
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'password_reset.html')

        updated_user = get_user_model().objects.get(username='testiranje2')
        self.assertTrue(updated_user.check_password('Testiranje123!'))

    def test_password_reset_form_invalid_no_special_characters(self):
        response = self.client.post(reverse('password_reset_form'), {
            'old': 'Testiranje123!',
            'new': 'Test1234'
        })
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'password_reset.html')

        updated_user = get_user_model().objects.get(username='testiranje2')
        self.assertTrue(updated_user.check_password('Testiranje123!'))

if __name__ == '__main__':
    unittest.main()
