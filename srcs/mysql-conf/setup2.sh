#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
  mkdir -p /run/mysqld
fi

if [ -d /work/mysql ]; then
  echo "MySQL directory already present, skipping creation"
else
  echo "MySQL data directory not found, creating DBs"

  mysql_install_db --user=root

  if [ "$MYSQL_ROOT_PASSWORD" = "" ]; then
    MYSQL_ROOT_PASSWORD=toor
  fi

  MYSQL_DATABASE=db
  MYSQL_USER=user
  MYSQL_PASSWORD=1337

  tmpfile=`mktemp`
  if [ ! -f "$tmpfile" ]; then
      return 1
  fi

  cat << EOF > $tmpfile
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD" WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
ALTER USER 'root'@'localhost' IDENTIFIED BY '';
EOF

  if [ "$MYSQL_DATABASE" != "" ]; then
    echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql

    if [ "$MYSQL_USER" != "" ]; then
    echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
    fi
  fi

  /usr/bin/mysqld --user=root < $tmpfile
  rm -f $tmpfile
fi
exec /usr/bin/mysqld --user=root 