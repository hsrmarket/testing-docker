#!/bin/bash -e

. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page
check_for_updates &

if [[ "$1" == "nami" && "$2" == "start" ]] || [[ "$1" == "/init.sh" ]]; then
  nami_initialize postgresql
  info "Starting postgresql... "
fi

nami start postgresql
sleep 5s
psql -U postgres hsrmarket < /root/dump.sql
psql -U postgres -c "alter role postgres set search_path = 'hsrmarket';"
nami stop postgresql

exec tini -- "$@"
