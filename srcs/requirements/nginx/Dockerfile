FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx

RUN mkdir -p /etc/nginx/ssl/ && mkdir -p /run/nginx/

COPY ./tools/nginx.crt ./tools/nginx.key /etc/nginx/ssl/

# copy nginx.conf
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf
RUN chmod 744 /etc/nginx/conf.d/default.conf

# copy script nginx.sh
RUN mkdir -p /files/
COPY ./srcs/nginx.sh /files/
RUN chmod 744 /files/nginx.sh

EXPOSE 80 443

CMD ["/bin/sh", "-c", "/files/nginx.sh"]
