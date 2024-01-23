FROM debian:11.8

RUN apt-get update && apt-get install -y \
    dumb-init \
    wget \
    php7.4-fpm \
    php7.4-gd \
    php7.4-json \
    php7.4-mysql \
    php7.4-curl \
    php7.4-mbstring \
    php7.4-intl \
    php-imagick \
    php7.4-xml \
    php7.4-zip

WORKDIR /etc/php/7.4/fpm/pool.d

COPY ./conf/www.conf .

COPY ./tools/wordpress_init.sh /tmp/wordpress_init.sh

WORKDIR /tmp

RUN chmod +x /tmp/wordpress_init.sh

EXPOSE 9000

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/tmp/wordpress_init.sh"]