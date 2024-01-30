#!/bin/sh

openssl req \
    -newkey rsa:$SSL_RSA_KEY_SIZE \
    -days $SSL_CERT_VALIDITY_DAYS \
    -nodes -x509 \
    -subj "$SSL_SUBJECT" \
    -keyout $SSL_PRIVATE_KEY_PATH \
    -out $SSL_CERTIFICATE_PATH

chmod 600 $SSL_CERTIFICATE_PATH $SSL_PRIVATE_KEY_PATH

echo "\
--------------------
@nginx ready
@port:443
--------------------"

exec nginx -g 'daemon off;'