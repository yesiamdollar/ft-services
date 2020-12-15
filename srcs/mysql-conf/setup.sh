#!/bin/sh
mysql_install_db --user=mysql --datadir=/var/lib/mysql
mkdir /run/openrc/
touch /run/openrc/softlevel
rc-status
rc-service mariadb start
mysqladmin -u root password toor
mysql -u root < /users.sql
rc-service mariadb restart 
tail -f /dev/null