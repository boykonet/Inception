FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-common mariadb-client mariadb-server-utils

RUN mkdir -p /run/mysqld/
RUN chmod -R 744 /run/mysqld/

# copy mariadb.cnf
COPY ./conf/mariadb.cnf /etc/my.cnf
RUN chmod 744 /etc/my.cnf

RUN mkdir -p /files

# copy init.sql
COPY ./conf/init.sql /files/init.sql
RUN chmod 744 /files/init.sql

# copy run.sh
COPY ./tools/mariadb.sh /files/run.sh
RUN chmod 744 /files/run.sh

CMD ["/bin/sh", "-c", "/files/run.sh"]
