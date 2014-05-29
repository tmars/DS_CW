# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os

os.sys.path.insert(0,os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))) 
import task

PAYSYS_CLIENT_ID = 'W91U15BX'
PAYSYS_TRANSFER_PAGE = task.get('B_URL', 'payment') + 'tranfer/?'
PAYSYS_XMLRPC_PAGE = task.get('URL', 'payment') + 'xmlrpc/'

EMAIL = task.get('EMAIL')
PASSWORD = task.get('PASS')

BASE_DIR = os.path.dirname(os.path.dirname(__file__))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'ph4ysr7%mm62nfmgy1&i!u=9^##&%-*w!9guvb4)*de1#v2ur3'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'catalog',
    'account',
    'xml_rpc_server',
    'bootstrap3_datetime',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

ROOT_URLCONF = 'center_sys.urls'

WSGI_APPLICATION = 'center_sys.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': task.get("DBNAME"),
        'USER': 'root',
        'PASSWORD': '',
        'HOST': '127.0.0.1',
        'PORT': '',
    }
}

# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/

LANGUAGE_CODE = 'ru-ru'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


XMLRPC_METHODS = (
    ('xml_rpc_server.views.register_office', 'register_office'),
    ('xml_rpc_server.views.is_active_transaction', 'is_active_transaction'),
)

PROJECT_PATH = os.path.realpath(os.path.dirname(__file__))

STATIC_URL = '/static/'

STATICFILES_DIRS = ( 
    os.path.join(PROJECT_PATH, "static"),
)

TEMPLATE_DIRS = (
    PROJECT_PATH + '/templates/'
)