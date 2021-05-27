#!/bin/bash -e

. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page

if [[ "$1" == "nami" && "$2" == "start" ]] || [[ "$1" == "/init.sh" ]]; then
    nami_initialize tomcat mysql-client jasperreports
    info "Starting gosu... "
    if [ -d "/etc/opt/bitnami/jasperreports/config/" ]; then
        if ! [ -z "$(ls -A /etc/opt/bitnami/jasperreports/config/)" ]; then 
            cp -r "/etc/opt/bitnami/jasperreports/config/"* "/opt/bitnami/jasperreports/"
        fi
    fi
fi

exec tini -- "$@"
