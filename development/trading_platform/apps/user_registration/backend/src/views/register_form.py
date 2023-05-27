from datetime import date, timedelta, datetime

from django.http import HttpRequest
from django.core.validators import EmailValidator
# from django.forms import ValidationError
# from django.contrib.auth.password_validation import validate_password

from apps.user_management.backend.src.utils.user_create import create_user
from apps.common.backend.utils.error_handling import internal_error_catcher


def get_cleaned_data(request: HttpRequest):
    user_data = {}

    # store only the non confidential fields' responses
    def store_previous_answers():
        request.session['usr'] = request.POST.get('username')
        request.session['email'] = request.POST.get('email')
        request.session['gender'] = request.POST.get('gender')
        request.session['birthday'] = request.POST.get('birthday')

    def parse_data():
        is_valid = True

        try:  # process email
            user_data["email"] = request.POST["email"]
        except Exception as e:
            is_valid = False
            request.session['email_err'] = 'Invalid email'

        try:  # process username
            user_data["usr"] = request.POST["username"]
        except Exception as e:
            is_valid = False
            request.session['usr_err'] = 'Invalid username'

        try:  # process password
            user_data["pwd"] = request.POST["password"]
        except Exception as e:
            is_valid = False
            request.session['pwd_err'] = 'Invalid password'

        try:  # process gender
            user_data["cntry"] = request.POST["country"]
        except Exception as e:
            is_valid = False
            request.session['cntry_err'] = 'Invalid country'

        try:  # process birthday
            user_data["birthday"] = datetime\
                .strptime(request.POST["birthday"], '%Y-%m-%d')\
                .date()

        except Exception as e:
            is_valid = False
            request.session['birthday_err'] = 'Invalid birthday'

        try:  # process gender
            user_data["gender"] = request.POST["gender"]
        except Exception as e:
            is_valid = False
            request.session['gender_err'] = 'Invalid gender'

        if not is_valid:
            store_previous_answers()
            raise Exception('parse: Form is not valid')

    def validate_data():
        is_valid = True

        try:  # process email
            EmailValidator()(user_data["email"])
            # do not check if email already exists, let
            # db throw error

        except Exception as e:
            is_valid = False
            request.session['email_err'] = str(e)

        # do not check if username already exists, let
        # db throw error

        # do not check if password is valid, let
        # db throw error

        # TODO: do not check if country is valid, let
        # db throw error ???

        # validate the birthday, 18+ years old:
        today = date.today()
        eighteen_years_ago = today - timedelta(days=18 * 365)  # Assuming 365 days in a year

        if user_data["birthday"] > eighteen_years_ago:
            is_valid = False
            request.session['birthday_err'] = 'You must be 18+ years old'

        # validate the gender
        genders = ("Female", "Male", "Other")
        if user_data["gender"] not in genders:
            is_valid = False
            request.session['gender_err'] = 'Invalid gender'

        if not is_valid:
            store_previous_answers()
            raise Exception('validate: Form is not valid')

    def main():
        parse_data()
        validate_data()

    internal_error_catcher(request, main)

    return user_data


def register(user_data: dict):
    # create the user in the database
    create_user(
        email=user_data['email'],
        username=user_data['usr'],
        password=user_data['pwd'],
        birthday=user_data['birthday'],
        gender=user_data['gender'],
        country=user_data['cntry']
    )

    return
