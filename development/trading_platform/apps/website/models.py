# from django.db import models

from mongoengine import fields, Document, EmbeddedDocument, EmbeddedDocumentField


# Create your models here.



# ======================================
# NoSQL entities:


class SupportRequest(Document):
    class ProcessingInfo(EmbeddedDocument):
        admin_id = fields.IntField(required=True)
        status = fields.StringField(required=True)
        comment = fields.StringField()

    name = fields.StringField(required=True)
    email = fields.EmailField(required=True)
    time = fields.DateTimeField(required=True)
    msg = fields.StringField(required=True)
    processing = EmbeddedDocumentField(ProcessingInfo)
