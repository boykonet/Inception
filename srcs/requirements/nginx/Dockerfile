FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx gettext
RUN apk add php php-fpm php-opcache php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-json php-zlib php-mysqli php-phar php-bz2

RUN mkdir -p /etc/nginx/ssl/ \
    && mkdir -p /run/nginx/ \
    && mkdir -p /var/www/wordpress

RUN chown 755 /var/www

COPY ./tools/gkarina.42.fr.crt ./tools/gkarina.42.fr.key /etc/nginx/ssl/

RUN chmod 400 /etc/nginx/ssl/gkarina.42.fr.crt \
    && chmod 400 /etc/nginx/ssl/gkarina.42.fr.key

RUN mkdir -p /files/

# copy nginx.conf
COPY ./conf/nginx.conf /files/nginx.template
RUN chmod 744 /files/nginx.template

RUN chmod 744 /etc/nginx/conf.d/default.conf

# copy script nginx.sh
COPY ./tools/nginx.sh /files/run.sh
RUN chmod 744 /files/run.sh

CMD ["/bin/sh", "-c", "/files/run.sh"]