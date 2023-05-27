from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin

# Create your models here.
from apps.asset_management.models import Asset


class UserManager(BaseUserManager):
    def create_user(self, username, password, email):
        # Create and save a regular user
        user = self.model(
            username=username,
            email=email,
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, username, password, email):
        # Create and save a superuser
        user = self.create_user(
            username=username,
            password=password,
            email=email,
        )
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user


# class User(models.Model):
class User(AbstractBaseUser, PermissionsMixin):
    iduser = models.IntegerField(db_column='IdUser', primary_key=True)
    username = models.CharField(db_column='Username', max_length=32, unique=True)
    password = models.CharField(db_column='Password', max_length=128)
    email = models.CharField(db_column='Email', max_length=64)

    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)

    objects = UserManager()

    USERNAME_FIELD = 'username'
    EMAIL_FIELD = 'email'
    REQUIRED_FIELDS = ['email']

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = False
        db_table = 'user'


class FundsTransferMethod(models.Model):
    idpaymentmethod = models.IntegerField(db_column='IdPaymentMethod', primary_key=True)  # Field name made lowercase.
    accesskey = models.CharField(db_column='AccessKey', max_length=64)  # Field name made lowercase.
    makebeliefbalance = models.DecimalField(db_column='MakeBeliefBalance', max_digits=10, decimal_places=2, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = False
        db_table = 'FundsTransferMethod'


class MakeBeliefOwns(models.Model):
    idpaymentmethod = models.OneToOneField(FundsTransferMethod, models.DO_NOTHING, db_column='IdPaymentMethod', primary_key=True)  # Field name made lowercase. The composite primary key (IdPaymentMethod, IdAsset) found, that is not supported. The first column is selected.
    idasset = models.ForeignKey(Asset, models.DO_NOTHING, db_column='IdAsset')  # Field name made lowercase.
    quantity = models.IntegerField(db_column='Quantity')  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = False
        db_table = 'makebeliefowns'
        unique_together = (('idpaymentmethod', 'idasset'),)


class Country(models.Model):
    idcountry = models.IntegerField(db_column='IdCountry', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=32)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = False
        db_table = 'country'


# class User(models.Model):
# class User(AbstractBaseUser):
#     iduser = models.IntegerField(db_column='IdUser', primary_key=True)  # Field name made lowercase.
#     username = models.CharField(db_column='Username', max_length=32)  # Field name made lowercase.
#     password = models.CharField(db_column='Password', max_length=32)  # Field name made lowercase.
#     email = models.CharField(db_column='Email', max_length=64)  # Field name made lowercase.

#     class Meta:
        app_label = 'apps.user_management'
        app_label = 'user_management'
#         managed = False
#         db_table = 'user'


class Administrator(models.Model):
    iduser = models.OneToOneField('User', models.DO_NOTHING, db_column='IdUser', primary_key=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = False
        db_table = 'administrator'


class Trader(models.Model):
    iduser = models.OneToOneField('User', models.DO_NOTHING, db_column='IdUser', primary_key=True)  # Field name made lowercase.
    birthday = models.DateTimeField(db_column='Birthday', blank=True, null=True)  # Field name made lowercase.
    sex = models.CharField(db_column='Sex', max_length=6, blank=True, null=True)  # Field name made lowercase.
    idcountry = models.ForeignKey(Country, models.DO_NOTHING, db_column='IdCountry')  # Field name made lowercase.
    termsacceptancetime = models.DateTimeField(db_column='TermsAcceptanceTime')  # Field name made lowercase.
    idselectedfundstrasnfermethod = models.ForeignKey(FundsTransferMethod, models.DO_NOTHING, db_column='IdSelectedFundsTrasnferMethod', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = False
        db_table = 'trader'


class Broker(models.Model):
    iduser = models.OneToOneField('Trader', models.DO_NOTHING, db_column='IdUser', primary_key=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = False
        db_table = 'broker'


class BasicUser(models.Model):
    iduser = models.OneToOneField('Trader', models.DO_NOTHING, db_column='IdUser', primary_key=True)  # Field name made lowercase.

    class Meta:
        # app_label = 'apps.user_management'
        app_label = 'user_management'
        managed = False
        db_table = 'basicuser'
