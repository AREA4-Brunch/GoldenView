from django.test import Client, TestCase
from django.shortcuts import reverse


from apps.website.models import SupportRequest


class Tests(TestCase):

    def test_empty_name(self):
        response = self.client.post(
            reverse('form_contact_page'),
            {
                'name': '',
                'email': 'email@email.com',
                'message': 'Message'
            },
            follow=True
        )

        self.assertInHTML("you can't leave this field empty",
                          response.content.decode())

    def test_empty_email(self):
        response = self.client.post(reverse('form_contact_page'), {
            'name': 'Username',
            'email': '',
            'message': 'Message',
        })
        
        self.assertInHTML("you can't leave this field empty",
                          response.content.decode())

    def test_empty_message(self):
        response = self.client.post(reverse('form_contact_page'), {
            'name': 'Username',
            'email': 'testiranje2@example.com',
            'message': '',
        })
        
        self.assertInHTML("you can't leave this field empty",
                          response.content.decode())

    def test_success(self):
        response = self.client.post(reverse('form_contact_page'), {
            'name': 'Username',
            'email': 'testiranje2@example.com',
            'message': 'Hello',
        })

        support_request = SupportRequest.objects.filter(
            name='Username'
        ).first()

        self.assertIsNotNone(support_request)
        self.assertEqual(support_request.name, 'Username')
        self.assertEqual(support_request.msg, 'Hello')
        self.assertEqual(support_request.email, 'testiranje2@example.com')

        return
