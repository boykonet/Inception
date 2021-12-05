#!/bin/sh

envsubst '${DOMAIN_NAME} ${CERTS_PATH} ${WORDPRESS_CONTAINER_NAME} ${WORDPRESS_PORT}' < /files/nginx.template > /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'
