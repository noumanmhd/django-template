#!/bin/bash

# This script is entrypoint for the docker container

if [ -z "$DJANGO_WORKER" ] || [ "$DJANGO_WORKER" -lt 1 ]; then
    DJANGO_WORKER=8
fi

# Database migrations
python /app/manage.py migrate

# Collect static files
python /app/manage.py collectstatic --noinput

# Start Gunicorn server with Unicorn worker class
gunicorn project.asgi:application --bind 0.0.0.0:8000 --workers $DJANGO_WORKER --timeout 0 -k uvicorn.workers.UvicornWorker
