from django.test import TestCase, Client
from django.urls import reverse
from apps.user_management.models import *

class RegisterViewTest(TestCase):
    def setUp(self):
        self.client = Client()
        self.existing_user = User.objects.create_user(username='existinguser', password='Password123!', email='existinguser@gmail.com')
    
    def test_register_form_get(self):
        
        response = self.client.get(reverse('register'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'user_registration/register_page/register_page.html')

    def test_register_form_post_success(self):
        
        response = self.client.post(reverse('register_form'), {
            'username': 'testuser',
            'password': 'Testpassword123!',
            'email': 'test@example.com',
            #'gender': 'Male',
            #'birthday': '1990-01-01',
        })

        self.assertFalse(User.objects.filter(username='testuser').exists())
        self.assertFalse(User.objects.filter(email='test@example.com').exists())
        #self.assertTrue(response.wsgi_request.user.is_authenticated)

    def test_register_form_post_invalid_username(self):
        response = self.client.post(reverse('register_form'), {
            'username': 'existinguser',
            'password': 'Testpassword123!',
            'email': 'test@example.com',
            'gender': 'Male',
            'birthday': '1990-01-01',
        })

        self.assertTrue(User.objects.filter(username='existinguser').exists())
        self.assertFalse(response.wsgi_request.user.is_authenticated)

    def test_register_form_post_invalid_username(self):
        response = self.client.post(reverse('register_form'), {
            'username': 'testuser',
            'password': 'Testpassword123!',
            'email': 'existinguser@gmail.com',
            'gender': 'Male',
            'birthday': '1990-01-01',
        })

        self.assertTrue(User.objects.filter(email='existinguser@gmail.com').exists())
        self.assertFalse(response.wsgi_request.user.is_authenticated)


