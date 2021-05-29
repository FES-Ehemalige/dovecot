#!/usr/bin/env sh

mkdir -p /var/vmail/sieve/global
chown -R vmail:vmail /var/vmail

exec "$@"
