#!/bin/bash

/usr/local/bin/docker-entrypoint.sh "$@"

yes | cp -rf /var/www/composer/commons-booking-2 /var/www/html/wp-content/plugins/

