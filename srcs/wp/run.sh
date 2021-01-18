#!/bin/sh
php-fpm7 -R &
nginx -g "daemon off;" &
telegraf &

while [[ true ]]; do
    sleep 1
done