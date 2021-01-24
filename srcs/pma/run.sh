#!/bin/bash

nginx
php-fpm7 -R&

while [ 1 -eq 1 ]; do
	val=`ps`
	if [[ "$val" =~ "nginx" ]] && [[ "$val" =~ "php-fpm7" ]]; then
          echo ""
    else
          break ;
    fi
done
