from apps.user_management.models import *
from django.test import TestCase

def create_user(username, password):
    user = User(username=username)
    user.set_password(password)
    user.save()
    return user


class TestUser(TestCase):

    def test_login_success(self):
        user = create_user(username='testuser', password='Password123!')
        logged_in = self.client.login(username='testuser', password='Password123!')
        self.assertTrue(logged_in)
    
    def test_login_invalid_password(self):
        user = create_user(username='testuser', password='Password123!')
        logged_in = self.client.login(username='testuser', password='Password123')
        self.assertFalse(logged_in)

    def test_login_invalid_username(self):
        user = create_user(username='testuser', password='Password123!')
        logged_in = self.client.login(username='testuse', password='Password123!')
        self.assertFalse(logged_in)

