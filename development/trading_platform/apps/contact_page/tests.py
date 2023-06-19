from django.test import Client, TestCase
from django.shortcuts import reverse


from apps.website.models import SupportRequest


class Tests(TestCase):

    def test_empty_name(self):
        response = self.client.post(reverse('form_contact_page'), {
            'name': '',
            'email': 'email@email.com',
            'message': 'Message'
        })

        self.assertContains(response, 'you can't leave this field empty')

    def test_empty_email(self):
        response = self.client.post(reverse('form_contact_page'), {
            'name': 'Username',
            'email': '',
            'message': 'Message',
        })

        self.assertContains(response, 'you can't leave this field empty')

    def test_empty_message(self):
        response = self.client.post(reverse('form_contact_page'), {
            'name': 'Username',
            'email': 'testiranje2@example.com',
            'message': '',
        })

        self.assertContains(response, 'you can't leave this field empty')

    def test_success(self):
        response = self.client.post(reverse('form_contact_page'), {
            'name': 'Username',
            'email': 'testiranje2@example.com',
            'message': 'Hello',
        })

        support_request = SupportRequest.objects.get(
            name='Username'
        )

        self.assertIsNotNone(support_request)
        self.assertEqual(support_request.msg, 'Hello')
        self.assertEqual(support_request.email, 'testiranje2@example.com')

        return
