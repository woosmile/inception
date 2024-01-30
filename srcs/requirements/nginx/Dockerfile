FROM debian:11.8

EXPOSE 443

ENV SSL_RSA_KEY_SIZE \
    SSL_CERT_VALIDITY_DAYS \
    SSL_PRIVATE_KEY_PATH \
    SSL_CERTIFICATE_PATH \
    SSL_SUBJECT

RUN apt-get update && \
    apt-get install -y \
    dumb-init \
    nginx \
    openssl

WORKDIR /etc/nginx/sites-available

COPY ./conf/mynginx .

RUN ln -s /etc/nginx/sites-available/mynginx /etc/nginx/sites-enabled/mynginx && \
    unlink /etc/nginx/sites-enabled/default

WORKDIR /tmp

COPY ./tools/nginx_setup.sh .

RUN chmod +x nginx_setup.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["sh", "nginx_setup.sh"]