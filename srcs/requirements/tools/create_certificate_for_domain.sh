#!/bin/sh

apk add openssl

# generate closed key
openssl genrsa -out /files/rootCA.key 2048

if [ -z "$1" ]
then
  echo "Please supply a subdomain to create a certificate for";
  echo "e.g. gkarina.42.fr"
  exit;
fi

if [ -f "/files/device.key" ]; then
  KEY_OPT="-key"
else
  KEY_OPT="-keyout"
fi

DOMAIN=$1
COMMON_NAME=${2:-$1}

SUBJECT="/C=RU/ST=None/L=Moscow/O=School21/OU=School21/CN=$COMMON_NAME/emailAddress=gkarina@student.21-school.ru"
NUM_OF_DAYS=365

openssl req -x509 -new -nodes -key /files/rootCA.key -sha256 -days $NUM_OF_DAYS -subj "$SUBJECT" -out files/rootCA.pem

# generate certificate
openssl req -new -newkey rsa:2048 -sha256 -nodes $KEY_OPT /files/device.key -subj "$SUBJECT" -out /files/device.csr

cat /files/v3.ext | sed s/%%DOMAIN%%/$COMMON_NAME/g > /tmp/__v3.ext

openssl x509 -req -in /files/device.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out device.crt -days $NUM_OF_DAYS -sha256 -extfile /tmp/__v3.ext