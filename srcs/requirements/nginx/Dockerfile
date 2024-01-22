FROM debian:11.8

RUN apt-get update && apt-get install -y dumb-init nginx openssl

WORKDIR /etc/nginx/sites-available

COPY ./conf/myservice .

COPY ./tools/entrypoint.sh /tmp/entrypoint.sh

RUN chmod +x /tmp/entrypoint.sh

# ENTRYPOINT ["/usr/bin/dumb-init", "--", "/tmp/entrypoint.sh"]
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD [ "/tmp/entrypoint.sh" ]

# CMD ['nginx', '-g']