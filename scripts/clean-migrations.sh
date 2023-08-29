#!/bin/bash

# This script will remove all migrations from the project
find . -path "*/migrations/*.py" -not -name "__init__.py" -delete
find . -path "*/migrations/*.pyc" -delete
