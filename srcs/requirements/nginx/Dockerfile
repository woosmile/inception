FROM debian:11.8

RUN apt-get update && apt-get install -y \
    dumb-init \
    nginx \
    openssl

WORKDIR /etc/nginx/sites-available

COPY ./conf/mynginx .

COPY ./tools/nginx_init.sh /tmp/nginx_init.sh

RUN chmod +x /tmp/nginx_init.sh

EXPOSE 443

ENV DOMAIN_NAME=${DOMAIN_NAME}

# ENTRYPOINT ["/usr/bin/dumb-init", "--", "/tmp/nginx_init.sh"]
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# CMD ['nginx', '-g']
CMD [ "/tmp/nginx_init.sh" ]