#!/bin/bash

if [ -z "$CELERY_WORKERS" ] || [ "$CELERY_WORKERS" -lt 1 ]; then
    CELERY_WORKERS=4
fi

celery -A project worker -l info -n default@%h -Ofair -c $CELERY_WORKERS
