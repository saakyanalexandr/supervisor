FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
    supervisor cron docker.io wget unzip php-cli php-mbstring composer nano \
    && rm -rf /var/lib/apt/lists/*

COPY data/supervisord.conf /etc/supervisor/supervisord.conf
COPY data/crontab /etc/cron.d/app-cron

RUN chmod 0644 /etc/cron.d/app-cron && crontab /etc/cron.d/app-cron

EXPOSE 8080
EXPOSE 9001

ARG PROJECT_PATH
WORKDIR ${PROJECT_PATH}

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]