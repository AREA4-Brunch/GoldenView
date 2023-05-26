from django.http import HttpRequest


def validate_register_form(request: HttpRequest):
    is_valid = False

    request.session['email_err'] = 'Err msg email'
    request.session['usr_err'] = 'Err msg user'
    request.session['pwd_err'] = 'Err msg pwd'
    request.session['cntry_err'] = 'Err msg cntry'
    request.session['birthday_err'] = 'Err msg birthday'
    request.session['gender_err'] = 'Err msg gender'

    request.session['usr'] = 'Entered username'
    request.session['email'] = 'Entered email'
    request.session['gender'] = 'Other'

    return is_valid
