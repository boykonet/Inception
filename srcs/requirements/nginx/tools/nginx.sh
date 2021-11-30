#!/bin/sh

envsubst < /files/nginx.template > /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'
