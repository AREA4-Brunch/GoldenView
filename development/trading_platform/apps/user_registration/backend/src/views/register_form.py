from django.http import HttpRequest


def validate_register_form(request: HttpRequest):
    is_valid = False

    request.session['email_err'] = 'Err msg email'
    request.session['usr_err'] = 'Err msg user'
    request.session['pwd_err'] = 'Err msg pwd'
    request.session['usr'] = 'Entered username'

    return is_valid
