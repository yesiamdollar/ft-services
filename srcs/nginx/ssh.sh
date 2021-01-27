#!/bin/sh

adduser dollar -D

echo -e "1234aa\n1234aa\n" | passwd dollar


if [ -f rm -rf /etc/ssh/ssh_host_rsa_key ]; then
    rm -rf /etc/ssh/ssh_host_rsa_key
fi

if [ -f  /etc/ssh/ssh_host_dsa_key ]; then
    rm -rf /etc/ssh/ssh_host_dsa_key
fi
# generate fresh rsa key
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
# generate fresh dsa key
ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa

