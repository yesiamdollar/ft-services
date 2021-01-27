#!/bin/sh

nginx
php-fpm7 -R&

sleep 20s
val=`ps`

if [[ ! "$val" =~ "nginx" ]]; then
		nginx
fi

if [[ ! "$val" =~ "php-fpm7" ]]; then
		php-fpm7 -R&
fi

while [ 1 -eq 1 ]; do
	val=`ps`
	if [[ ! "$val" =~ "nginx" ]] || [[ ! "$val" =~ "php-fpm7" ]]; then
          break ;
    fi
done