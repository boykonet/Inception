#!/bin/sh

mysql_install_db --skip-test-db --user=mysql --datadir=/var/lib/mysql

sed -i.original -e "s/\'{MYSQL_DATABASE}\'/$MYSQL_DATABASE/g" \
	              -e "s/{MYSQL_USER}/$MYSQL_USER/g" \
	              -e "s/{MYSQL_PASSWORD}/$MYSQL_PASSWORD/g" \
	              -e "s/{MYSQL_ROOT_PASSWORD}/$MYSQL_ROOT_PASSWORD/g" /files/init.sql

mysqld --user=mysql --datadir=/var/lib/mysql --init-file=/files/init.sql