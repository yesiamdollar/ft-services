#!/bin/sh

nginx -g "daemon off;" && /usr/sbin/sshd -D

# while [ 1 -eq 1 ]; do
#     echo ""
# done
