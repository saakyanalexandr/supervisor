#!/bin/bash
set -e

envsubst < /etc/supervisor/supervisord.conf.template > /etc/supervisor/supervisord.conf

exec supervisord -n