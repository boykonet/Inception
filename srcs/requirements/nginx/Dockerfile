FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx gettext

RUN mkdir -p /etc/nginx/ssl/ && mkdir -p /run/nginx/

COPY ./tools/gkarina.42.fr.crt ./tools/gkarina.42.fr.key /etc/nginx/ssl/

RUN mkdir -p /files/

# copy nginx.conf
COPY ./conf/nginx.conf /files/nginx.template
RUN chmod 744 /files/nginx.template

# copy script nginx.sh
COPY ./tools/nginx.sh /files/run.sh
RUN chmod 744 /files/run.sh

CMD ["/bin/sh", "-c", "/files/run.sh"]