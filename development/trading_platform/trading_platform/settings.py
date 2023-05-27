"""
Django settings for trading_platform project.

Generated by 'django-admin startproject' using Django 4.2.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/4.2/ref/settings/
"""

import os  # for db config environ vars
import logging  # custom logging settings

from pathlib import Path

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-mwngl(_57qapftu&sb!gfnnq$win#!9ie^3b_7t4s_*4c$a%ig'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    'deployment',  # for project commands, staticfiles finders, etc.
    'apps.common',  # for common constant content (static, const .html, imgs...)

    # Apps / Featuers:
    'apps.website.apps.WebsiteConfig',
    'apps.assets_view.apps.AssetsViewConfig',
    'apps.user_login.apps.UserLoginConfig',
    'apps.user_registration.apps.UserRegistrationConfig',
    'apps.user_management.apps.UserManagementConfig',
    'apps.disclaimer.apps.DisclaimerConfig',
    'apps.asset_management.apps.AssetManagementConfig',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'trading_platform.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        # 'APP_DIRS': True,
        'OPTIONS': {
            'loaders': [
                'deployment.linking.templates.finders.TemplateComponentsAppLoader.TemplateComponentsAppLoader',
                'deployment.linking.templates.finders.TemplateViewAppLoader.TemplateViewAppLoader',
                'django.template.loaders.app_directories.Loader',
            ],

            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'trading_platform.wsgi.application'


# Database
# https://docs.djangoproject.com/en/4.2/ref/settings/#databases


from django.conf import settings

# Get the current value of the DATABASE_ROUTERS setting
routers = getattr(settings, 'DATABASE_ROUTERS', [])

# Append your custom routers to the list
routers.append('deployment.linking.databases.AppDataRouter.AppDataRouter')

# Update the DATABASE_ROUTERS setting with the new list of routers
settings.DATABASE_ROUTERS = routers

# DATABASE_ROUTERS = [
#     'deployment.linking.databases.AppDataRouter.AppDataRouter',
#     # 'django.contrib.auth.routers.ModelRouter',
#     # 'django.contrib.contenttypes.routers.ContentTypeRouter',
#     # 'django.contrib.sessions.routers.SessionRouter',
#     # 'django.contrib.sites.routers.SiteRouter',
# ]


DATABASES = {
    'default': {  # django built in sessions, etc as mysql db
        'ENGINE': 'django.db.backends.mysql',
        'NAME': os.environ.get("DB_DJANGO_BUILT_IN_NAME", "").strip(),
        'USER': os.environ.get("DB_DJANGO_BUILT_IN_USER", "").strip(),
        'PASSWORD': os.environ.get("DB_DJANGO_BUILT_IN_PASSWORD", "").strip(),
        'HOST': os.environ.get("DB_DJANGO_BUILT_IN_HOST", "").strip(),
        'PORT': int(os.environ.get("DB_DJANGO_BUILT_IN_PORT", "3306").strip()),
        'OPTIONS': {
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
        }
    },

    'trading_platform': {  # trading_platform mysql db
        'ENGINE': 'django.db.backends.mysql',
        'NAME': os.environ.get("DB_TRADING_PLATFORM_NAME", "").strip(),
        'USER': os.environ.get("DB_TRADING_PLATFORM_USER", "").strip(),
        'PASSWORD': os.environ.get("DB_TRADING_PLATFORM_PASSWORD", "").strip(),
        'HOST': os.environ.get("DB_TRADING_PLATFORM_HOST", "").strip(),
        'PORT': int(os.environ.get("DB_TRADING_PLATFORM_PORT", "3306").strip()),
        'OPTIONS': {
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
        }
    }
}


# Password validation
# https://docs.djangoproject.com/en/4.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
        'OPTIONS': {
            'min_length': 8,
        }
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.UppercasePasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.LowercasePasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthPasswordValidator',
        'OPTIONS': {
            'min_length': 1,
        }
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumUpperCasePasswordValidator',
        'OPTIONS': {
            'min_uppercase': 1,
        }
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLowerCasePasswordValidator',
        'OPTIONS': {
            'min_lowercase': 1,
        }
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumDigitPasswordValidator',
        'OPTIONS': {
            'min_digits': 1,
        }
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumSpecialCharacterPasswordValidator',
        'OPTIONS': {
            'min_special_characters': 1,
        }
    },
]


# Internationalization
# https://docs.djangoproject.com/en/4.2/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.2/howto/static-files/

STATICFILES_FINDERS = [
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    'deployment.linking.staticfiles.finders.StaticAppDirectoriesFinder.StaticAppDirectoriesFinder'
]

STATIC_URL = 'static/'
STATIC_ROOT = 'static_root/'

STATICFILES_DIRS = [  # additional to ones in apps
    # Paths MUST use Unix-style forward slashes, even on Windows:
    ('common', 'apps/common/frontend/src/static/common')
]


# Default primary key field type
# https://docs.djangoproject.com/en/4.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'


# Custom globals:

READ_MNGMNT_CMNDS_DOCS_MSG = r"\nCheckout management/commands/README.md on how to use this command."
DEFAULT_APP_STATICFILES_DIR = "frontend/src/static/"


# Setup the logging

# Set the log file path
LOG_FILE_PATH = BASE_DIR / 'logs/exec_logs.log'

# Configure logging
logging.basicConfig(
    filename=LOG_FILE_PATH,
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)


# Custom User class:

AUTH_USER_MODEL = 'user_management.User'
