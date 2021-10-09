#!/bin/bash

python ddng/manage.py makemigrations --no-input

python ddng/manage.py migrate --no-input

python ddng/manage.py collectstatic --no-input

exec gunicorn ddng.ddng.wsgi:application -b 0.0.0.0:8000 --reload