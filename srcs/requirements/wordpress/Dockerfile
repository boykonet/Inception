FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add wget openrc

RUN apk add php php-fpm php-opcache php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-json php-zlib php-mysqli php-phar php-bz2
RUN apk add mariadb-client

RUN mkdir -p /var/www/wordpress

RUN wget https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /bin/wp

# copy php7-fpm www.conf
COPY ./conf/www.conf /etc/php7/php-fpm.d/www.conf
RUN chmod 744 /etc/php7/php-fpm.d/www.conf

RUN mkdir -p /files

# copy script
COPY ./tools/wordpress.sh /files/run.sh
RUN chmod 744 /files/run.sh

RUN rc-update add php-fpm7 default

CMD ["/bin/sh", "-c", "/files/run.sh"]
