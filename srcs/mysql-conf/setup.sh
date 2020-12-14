#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
  mkdir -p /run/mysqld
fi
if [ -d /work/mysql ]; then
  echo "MySQL directory already present, skipping creation"
else
  echo "MySQL data directory not found, creating DBs"

  mysql_install_db --user=root

  cat << EOF > tmpfile
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY "toor" WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
ALTER USER 'root'@'localhost' IDENTIFIED BY '';
CREATE DATABASE IF NOT EXISTS 'db' CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER 'dollar'@'%' IDENTIFIED BY '1337';
GRANT ALL ON *.* to 'dollar'@'%' IDENTIFIED BY '1337';
EOF
   echo "hello" > jj
  /usr/bin/mysqld --user=root < tmpfile 
fi
exec /usr/bin/mysqld