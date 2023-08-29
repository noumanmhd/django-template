#!/bin/bash

# This script is entrypoint for the docker container

if [ -z "$GUNICORN_WORKERS" ] || [ "$GUNICORN_WORKERS" -lt 1 ]; then
    GUNICORN_WORKERS=8
fi

# Database migrations
python /app/manage.py migrate

# Collect static files
python /app/manage.py collectstatic --noinput

# Start Gunicorn server with Unicorn worker class
gunicorn project.asgi:application --bind 0.0.0.0:8000 --workers $GUNICORN_WORKERS --timeout 0 -k uvicorn.workers.UvicornWorker
