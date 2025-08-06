#!/bin/bash
set -e

if [ -f /var/www/.env ]; then
    export $(grep -v '^#' /var/www/.env | xargs)
fi

if [ "$APP_ENV" = "dev" ]; then
    echo "Запуск в режиме разработки"
fi

exec supervisord -n