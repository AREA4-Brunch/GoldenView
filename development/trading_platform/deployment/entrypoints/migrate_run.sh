#!/bin/sh

python manage.py makemigrations user_management
python manage.py migrate user_management

python manage.py makemigrations wallet
python manage.py migrate wallet

python manage.py makemigrations asset_management
python manage.py migrate asset_management

python manage.py makemigrations file_management
python manage.py migrate file_management

python manage.py makemigrations broker_management
python manage.py migrate broker_management
    
python manage.py makemigrations
python manage.py migrate

python manage.py runserver 0.0.0.0:8000
