#!/bin/bash

nginx
/usr/sbin/sshd -D&

while [ 1 -eq 1 ]; do
	val=`ps`
	if [[ ! "$val" =~ "nginx" ]] || [[ ! "$val" =~ "sshd" ]]; then
            break ;
    fi
done
