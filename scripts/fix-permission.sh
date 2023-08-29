#!/bin/bash

# This script will fix permissions for docker volumes

docker compose exec -u root backend bash -c "chown -R app:app /app"
