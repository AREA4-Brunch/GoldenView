import logging

def internal_error_catcher(request, my_func):
    try:
        my_func()

    except Exception as e:
        request.session['internal_err'] = str(e)
        logging.error(f'Internal error: {e}')
        raise e
