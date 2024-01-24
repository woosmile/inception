FROM debian:11.8

RUN apt-get update && apt-get install -y \
    dumb-init \
    nginx \
    openssl

WORKDIR /etc/ssl

RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Cadet/CN=woosekim" \
    -keyout ./private/nginx.key \
    -out ./certs/nginx.crt

RUN chmod 600 ./certs/nginx.crt ./private/nginx.key

WORKDIR /etc/nginx/sites-available

COPY ./conf/mynginx .

RUN unlink /etc/nginx/sites-enabled/default

RUN ln -s /etc/nginx/sites-available/mynginx /etc/nginx/sites-enabled/mynginx

EXPOSE 443

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["nginx", "-g", "daemon off;"]