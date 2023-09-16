#!/usr/bin/env bash

set -e


RUN_MANAGE_PY='python manage.py'


# $RUN_MANAGE_PY makemigrations user_management
# $RUN_MANAGE_PY migrate user_management


# $RUN_MANAGE_PY makemigrations wallet
# $RUN_MANAGE_PY migrate wallet


# $RUN_MANAGE_PY makemigrations asset_management
# $RUN_MANAGE_PY migrate asset_management


# $RUN_MANAGE_PY makemigrations file_management
# $RUN_MANAGE_PY migrate file_management


# $RUN_MANAGE_PY makemigrations broker_management
# $RUN_MANAGE_PY migrate broker_management


$RUN_MANAGE_PY makemigrations --no-input
$RUN_MANAGE_PY migrate --no-input


$RUN_MANAGE_PY runserver 0.0.0.0:8000
