#!/bin/bash

# Usage:
#   sh docker-run.sh up rabbitmq
#   sh docker-run.sh down rabbitmq

ACTION=$1        # up / down / logs / restart / etc
SERVICE=$2       # rabbitmq / mysql / redis
FILE="${SERVICE}.yml"

if [ -z "$ACTION" ] || [ -z "$SERVICE" ]; then
  echo "Usage: sh docker-run.sh <up|down|logs|restart> <service-name>"
  exit 1
fi

if [ ! -f "$FILE" ]; then
  echo "Error: File '$FILE' not found."
  exit 1
fi

case $ACTION in
  up)
    echo "Starting $SERVICE..."
    docker compose -f "$FILE" up -d
    ;;
  down)
    echo "Stopping $SERVICE..."
    docker compose -f "$FILE" down
    ;;
  logs)
    echo "Showing logs for $SERVICE..."
    docker compose -f "$FILE" logs -f
    ;;
  restart)
    echo "Restarting $SERVICE..."
    docker compose -f "$FILE" down
    docker compose -f "$FILE" up -d
    ;;
  *)
    echo "Unknown action: $ACTION"
    echo "Available actions: up, down, logs, restart"
    exit 1
    ;;
esac
