#!/bin/sh

# apk add openssl
# openssl genrsa -out rootCA.key 2048
#

#openssl genrsa -out rootCA.key 2048
#
#openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.pem

if [ -z "$1" ]
then
  echo "Please supply a subdomain to create a certificate for";
  echo "e.g. gkarina.42.fr"
  exit;
fi

if [ -f "$CERTS_PATH/device.key" ]; then
  KEY_OPT="-key"
else
  KEY_OPT="-keyout"
fi

DOMAIN=$1
COMMON_NAME=${2:-$1}

SUBJECT="/C=RU/ST=None/L=Moscow/O=School21/OU=School21/CN=$COMMON_NAME/emailAddress=gkarina@student.21-school.ru"
NUM_OF_DAYS=365

openssl req -new -newkey rsa:2048 -sha256 -nodes $KEY_OPT device.key -subj "$SUBJECT" -out device.csr