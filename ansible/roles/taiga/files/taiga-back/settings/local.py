from .common import *
import os
from os import environ

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.getenv('DB_NAME'),
        'HOST': os.getenv('DB_HOST'),
        'PORT': os.getenv('DB_PORT'),
        'USER': os.getenv('DB_USER'),
        'PASSWORD': os.getenv('DB_PASSWORD')
    }
}

MEDIA_URL = os.getenv('SCHEME') + "://" + os.getenv('HOST') + ":" +  os.getenv('PORT') + "/media/"
STATIC_URL = os.getenv('SCHEME') + "://" + os.getenv('HOST') + ":" +  os.getenv('PORT') + "/static/"

MEDIA_ROOT = "/taiga/media"
STATIC_ROOT = "/taiga/static"

if 'SCHEME' in os.environ:
    SITES["front"]["scheme"] = os.getenv('SCHEME')  # http
    print("SCHEME = {}".format(SITES["front"]["scheme"]))

SITES['api']['domain'] = os.getenv('HOST') + ":" +  os.getenv('PORT')  # example.com:8080

SITES["front"]["domain"] = os.getenv('HOST') + ":" +  os.getenv('PORT') # example.com:8080

if 'SECRET_KEY' in os.environ:
    SECRET_KEY = os.getenv('SECRET_KEY') # default is in common.py as "aw3+t2r(8(0kkrhg8)gx6i96v5^kv%6cfep9wxfom0%7dy0m9e"
    print("SECRET_KEY = {}".format(SECRET_KEY))

if 'DEBUG' in os.environ:
    DEBUG = (os.getenv('DEBUG').lower() == "true") # True || False
    print("SECRET_KEY = {}".format(SECRET_KEY))

if 'PUBLIC_REGISTER_ENABLED' in os.environ:
    PUBLIC_REGISTER_ENABLED = (os.getenv('PUBLIC_REGISTER_ENABLED') == "True") # True || False
    print("PUBLIC_REGISTER_ENABLED= {}".format(PUBLIC_REGISTER_ENABLED))

# Taiga-event 

if os.getenv('RABBIT_PORT') is not None and os.getenv('REDIS_PORT') is not None:
    from .celery import *

    BROKER_URL = 'amqp://guest:guest@rabbit:5672'
    CELERY_RESULT_BACKEND = 'redis://redis:6379/0'
    CELERY_ENABLED = True

    EVENTS_PUSH_BACKEND = "taiga.events.backends.rabbitmq.EventsPushBackend"
    EVENTS_PUSH_BACKEND_OPTIONS = {"url": "amqp://guest:guest@rabbit:5672/"}

# email config

if 'DEFAULT_FROM_EMAIL' in os.environ:
    DEFAULT_FROM_EMAIL = os.getenv('DEFAULT_FROM_EMAIL') # "no-reply@example.com"
    print("DEFAULT_FROM_EMAIL = {}".format(DEFAULT_FROM_EMAIL))

SERVER_EMAIL = DEFAULT_FROM_EMAIL

if 'EMAIL_BACKEND' in os.environ:
    EMAIL_BACKEND = os.getenv('EMAIL_BACKEND') # "django.core.mail.backends.smtp.EmailBackend"
    print("EMAIL_BACKEND ={}".format(EMAIL_BACKEND))

if 'EMAIL_USE_TLS' in os.environ:
    EMAIL_USE_TLS = (os.getenv('EMAIL_USE_TLS').lower() == "true") # False
    print("EMAIL_USE_TLS = {}".format(EMAIL_USE_TLS))

if 'EMAIL_HOST' in os.environ:
    EMAIL_HOST = os.getenv('EMAIL_HOST') # "localhost"
    print("EMAIL_HOST = {}".format(EMAIL_HOST)) 

if 'EMAIL_HOST_USER' in os.environ:
    EMAIL_HOST_USER = os.getenv('EMAIL_HOST_USER') # EMAIL_HOST_USER should end by @domain.tld
    print("EMAIL_HOST_USER = {}".format(EMAIL_HOST_USER))    

if 'EMAIL_HOST_PASSWORD' in os.environ:
    EMAIL_HOST_PASSWORD = os.getenv('EMAIL_HOST_PASSWORD')
    print("EMAIL_HOST_PASSWORD = {}".format(EMAIL_HOST_PASSWORD))

if 'EMAIL_PORT' in os.environ:
    EMAIL_PORT = int(os.getenv('EMAIL_PORT')) # 25
    print("EMAIL_PORT = {}".format(EMAIL_PORT))

INSTALLED_APPS += ["taiga_contrib_ldap_auth_ext"]

if 'LDAP_SERVER' in os.environ:
    LDAP_SERVER = os.getenv('LDAP_SERVER') # "ldap://..." 
    print("LDAP_SERVER = {}".format(LDAP_SERVER))

if 'LDAP_PORT' in os.environ:
   LDAP_PORT = int(os.getenv('LDAP_PORT')) # 389
   print("LDAP_PORT = {}".format(LDAP_PORT))

# Full DN of the service account use to connect to LDAP server and search for login user's account entry
# If LDAP_BIND_DN is not specified, or is blank, then an anonymous bind is attempated
if 'LDAP_BIND_DN' in os.environ:
   LDAP_BIND_DN = os.getenv('LDAP_BIND_DN') # "uid=svc_account,cn=sysaccounts,cn=etc,dc=example,dc=com"
   print("LDAP_BIND_DN = {}".format(LDAP_BIND_DN))

if 'LDAP_BIND_PASSWORD' in os.environ:
   LDAP_BIND_PASSWORD = os.getenv('LDAP_BIND_PASSWORD') # "superSecretPassword"
   print("LDAP_BIND_PASSWORD = {}".format(LDAP_BIND_PASSWORD))

# Starting point within LDAP structure to search for login user
if 'LDAP_SEARCH_BASE' in os.environ:
   LDAP_SEARCH_BASE = os.getenv('LDAP_SEARCH_BASE') # "cn=users,cn=accounts,dc=example,dc=com"
   print("LDAP_SEARCH_BASE = {}".format(LDAP_SEARCH_BASE)) 

# Additional search criteria to the filter (will be ANDed)
if 'LDAP_SEARCH_FILTER_ADDITIONAL' in os.environ:
   LDAP_SEARCH_FILTER_ADDITIONAL = os.getenv('LDAP_SEARCH_FILTER_ADDITIONAL') # "(uid=*)"
   print("LDAP_SEARCH_FILTER_ADDITIONAL = {}".format(LDAP_SEARCH_FILTER_ADDITIONAL))

LDAP_SEARCH_SUFFIX = None 

# Names of LDAP attributes on user account to get email and full name
if 'LDAP_EMAIL_ATTRIBUTE' in os.environ:
   LDAP_EMAIL_ATTRIBUTE = os.getenv('LDAP_EMAIL_ATTRIBUTE') # "mail"
   print("LDAP_EMAIL_ATTRIBUTE = {}".format(LDAP_EMAIL_ATTRIBUTE))

if 'LDAP_FULL_NAME_ATTRIBUTE' in os.environ:
   LDAP_FULL_NAME_ATTRIBUTE = os.getenv('LDAP_FULL_NAME_ATTRIBUTE') # "cn"
   print("LDAP_FULL_NAME_ATTRIBUTE = {}".format(LDAP_FULL_NAME_ATTRIBUTE))

if 'LDAP_USERNAME_ATTRIBUTE' in os.environ:
   LDAP_USERNAME_ATTRIBUTE = os.getenv('LDAP_USERNAME_ATTRIBUTE') # "uid"
   print("LDAP_USERNAME_ATTRIBUTE = {}".format(LDAP_USERNAME_ATTRIBUTE))
