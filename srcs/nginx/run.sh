#!/bin/bash

nginx
/usr/sbin/sshd -D&
sleep 20s
val=`ps`

if [[ ! "$val" =~ "nginx" ]] ; then
    echo nginx > dol.log
fi

if [[ ! "$val" =~ "sshd" ]]; then
    echo sshd > dol.log
fi

while [ 1 -eq 1 ]; do
	val=`ps`
	if [[ ! "$val" =~ "nginx" ]] || [[ ! "$val" =~ "sshd" ]]; then
            break ;
    fi
done
