# Django Template Project

This project is a Django boilerplate configured with Docker, Celery, RabbitMQ, and Redis to streamline development and deployment.

## Key Features

### Pipenv

This project uses Pipenv for package management. The `Pipfile` and `Pipfile.lock` ensure that the correct dependencies are installed.

Run `pipenv install` to install the dependencies and `pipenv shell` to activate the virtual environment.

### Docker and Docker Compose

Docker is used for containerization, and Docker Compose orchestrates the services specified in `docker-compose.yml`. This includes services like:

- **Redis**: Caching and message broker.
- **RabbitMQ**: Message broker used by Celery.
- **Celery**: Asynchronous task queue.
- **Nginx**: Web server and reverse proxy.

Run `docker-compose up` to start all services.

### Scripts

Located in the `scripts/` directory, these shell scripts help with various tasks:

- `celery-beat.sh`, `celery-flower.sh`, `celery-worker.sh`: Start Celery services.
- `entrypoint.sh`: Executes commands necessary before running the app.
- `clean-migrations.sh`: Helper script to clean up Django migrations.
- `fix-permission.sh`: Fixes permissions for various directories.

### Environment Variables (.env)

Environment variables are defined in the `.env` file. This includes:

- Database settings (`USE_SQLITE`, `POSTGRES_*`)
- Celery configurations (`CELERY_WORKERS`, `CELERY_FLOWER_PORT`)
- Server settings (`GUNICORN_WORKERS`, `NGINX_PORT`)

Make sure to update these settings according to your needs.

### `apps` Directory

The `apps` directory is the designated location for all Django application modules. By placing all application modules here, you can better organize and manage your project's components.

#### Importance of `label`:

When configuring your application modules, it's important to set a `label` in the `apps.py` file. This `label` serves as a unique identifier for the app, and you will need to use it in settings and other configurations.

For example, if you have an app called `demo` within the `apps` directory, your `apps.py` should look like:

```python
from django.apps import AppConfig

class DemoConfig(AppConfig):
    name = 'apps.demo'
    label = 'demo'  # A unique, human-readable label for the app
```

## Quick Start

1. Clone the repository.
2. Navigate to the project directory and run `pipenv install`.
3. Rename `.env.example` to `.env` and update the variables.
4. Run `docker-compose up` to start the services.

For more details, please refer to the comments in each file.

## Contact

For any queries or issues, feel free to reach out via email at [contact@noumanmhd.com](mailto:contact@noumanmhd.com).

## Discussion

We welcome community discussions on this project. Please feel free to create an issue on GitHub for any bug reports, feature requests, or general questions.
