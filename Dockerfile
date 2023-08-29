FROM python:3.11-slim-bullseye

# Set environment variables for Python to not write pyc files and to buffer stdout and stderr
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system dependencies
RUN pip install --upgrade pip setuptools wheel\
    && pip install gunicorn uvicorn pipenv --no-cache-dir

# Create user with home directory
RUN useradd -M app

# Create app directory
WORKDIR /app

# Copy Pipfile and Pipfile.lock to app directory
COPY --chown=app:app Pipfile Pipfile.lock /app/

# Install Python dependencies
RUN python -m pipenv install --system --deploy --ignore-pipfile

# Permissions for app user
RUN chown -R app:app /app

# Copy project to app directory
COPY --chown=app:app . /app/

# Expose port 8000
EXPOSE 8000

# Change to app user
USER app

# Run entrypoint.sh
ENTRYPOINT ["/app/scripts/entrypoint.sh"]

