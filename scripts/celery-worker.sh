#!/bin/bash

celery -A project worker -l info -n default@%h -Ofair -c 12
