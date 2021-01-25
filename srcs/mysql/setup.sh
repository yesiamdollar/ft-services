#!/bin/sh
mysql_install_db --user=mysql --datadir=/var/lib/mysql
mkdir /run/openrc/
touch /run/openrc/softlevel
rc-status
rc-service mariadb start
mysqladmin -u root password toor
mysql -u root < /users.sql
mysql -u root < /wordpress.sql
rc-service mariadb restart

while [ 1 -eq 1 ]; do
	val=`ps`
    if [[ ! "$val" =~ "mysql" ]];then
        break ;
    fi
done