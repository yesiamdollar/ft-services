#!/bin/bash

nginx
/usr/sbin/sshd -D&

val=`ps`

if [[ ! "$val" =~ "nginx" ]] ; then
    nginx
    echo nginx > dol.log
fi

if [[ ! "$val" =~ "sshd" ]]; then
    /usr/sbin/sshd -D&
    echo sshd > dol.log
fi

while [ 1 -eq 1 ]; do
	val=`ps`
	if [[ ! "$val" =~ "nginx" ]] || [[ ! "$val" =~ "sshd" ]]; then
            break ;
    fi
done
