#!/bin/bash

# Copyright (C) 2020 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

set -e

if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "${USER_NAME:-default}:x:$(id -u):0:${USER_NAME:-default} user:${HOME}:/sbin/nologin" >> /etc/passwd
  fi
fi

# Wait until database is available
while ! pg_isready --host=${DB_HOST} --port=${DB_PORT} --dbname=${DB_NAME} > /dev/null 2> /dev/null; do
  echo "Waiting for database container to be ready..."
  sleep 1
done

sed s/SCHEME:\\/\\/HOST:PORT/$SCHEME:\\/\\/$HOST:$PORT/g /taiga/taiga-front-dist/dist/conf.template  > /taiga/taiga-front-dist/dist/conf.json

if  [[ -n "$LDAP_SERVER" ]]; then sed -i 's/{/{\n    "loginFormType": "ldap",/' taiga-front-dist/dist/conf.json; fi

# If django_migrations table doesn't exist initialize the database
export PGPASSWORD=$DB_PASSWORD

if [ "$( psql --host=$DB_HOST --port=$DB_PORT --username=$DB_USER --dbname=$DB_NAME -tAc "SELECT EXISTS (SELECT 1 FROM information_schema.tables where table_name = 'django_migrations')" )" == 'f' ]; then
   echo "Initializing database..."
   cd /taiga/taiga-back
   python manage.py migrate --noinput
   python manage.py loaddata initial_user
   python manage.py loaddata initial_project_templates
   python manage.py compilemessages
else
  echo "Database already exists."
fi

if [ -z "$(ls -A /taiga/static)" ]; then
  cd /taiga/taiga-back
  python manage.py collectstatic --noinput
fi

# Start taiga services
echo "Starting Taiga..."

# Start django
/etc/init.d/django start

# Start nginx
service nginx start
