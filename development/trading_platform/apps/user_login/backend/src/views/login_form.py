from django.http import HttpRequest


def validate_login_form(request: HttpRequest):
    is_valid = False

    request.session['usr_err'] = 'Err msg user'
    request.session['pwd_err'] = 'Err msg pwd'

    request.session['usr'] = 'Entered username'

    return is_valid
