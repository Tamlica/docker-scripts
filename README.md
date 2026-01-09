# Docker Scripts

This repository contains small scripts and Docker compose files to run local infrastructure services used for development and testing (RabbitMQ, Redis, etc), along with a helper script to run them.

**Overview**
- **Description**: A minimal set of files to start local RabbitMQ and Redis services and helper tooling to run them quickly.
- **Location**: All files live in this workspace root.

**Files**
- `docker-run.sh`: Convenience script to start the services (make executable before running).
- `rabbitmq.yml`: Docker Compose fragment / definition for RabbitMQ.
- `redis.yml`: Docker Compose fragment / definition for Redis.
- `es.yml`: Docker Compose fragment / definition for ElasticSearch.

**Prerequisites**
- **Docker**: Install Docker Desktop for macOS (https://www.docker.com/products/docker-desktop).
- **Shell**: The helper script assumes a POSIX shell (tested with `zsh` on macOS).

**Usage**
- Make the run script executable:

```bash
chmod +x ./docker-run.sh
```

**Example usage**

- Start

```bash
sh docker-run.sh up rabbitmq
```

Stop

```bash
sh docker-run.sh down rabbitmq
```

View logs

```bash
sh docker-run.sh logs rabbitmq
```

Restart

```bash
sh docker-run.sh restart rabbitmq
```

- If the script delegates to `docker compose` or `docker-compose`, you can also run the compose files directly, for example:

```bash
# start both services in detached mode
docker compose -f rabbitmq.yml -f redis.yml up -d

# stop and remove containers
docker compose -f rabbitmq.yml -f redis.yml down
```

**Notes**
- If you see permission errors when running `./docker-run.sh`, ensure the file is executable and you have rights to run Docker.
- If Docker is not running, start Docker Desktop first.
- The script may use `docker compose` (Docker's v2 Compose plugin) or `docker-compose`. If you have only one installed, adapt the commands accordingly.

**Troubleshooting**
- Docker permissions: Run `docker ps` to verify Docker is responding.
- Port conflicts: If RabbitMQ or Redis ports are in use, stop the conflicting services or edit the compose files to use different ports.
- Logs: Use `docker logs <container>` to inspect service logs.