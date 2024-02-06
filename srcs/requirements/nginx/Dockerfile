FROM debian:11.8

EXPOSE 443

RUN apt-get update && \
    apt-get install -y \
    dumb-init \
    nginx \
    openssl \
    psmisc \
    tree

WORKDIR /etc/nginx/sites-available

COPY ./conf/mynginx .

RUN ln -s /etc/nginx/sites-available/mynginx /etc/nginx/sites-enabled/mynginx && \
    unlink /etc/nginx/sites-enabled/default

WORKDIR /tmp

COPY ./tools/nginx_setup.sh .

RUN chmod +x nginx_setup.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--", "/tmp/nginx_setup.sh"]

CMD ["nginx", "-g", "daemon off;"]