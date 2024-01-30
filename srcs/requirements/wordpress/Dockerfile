FROM debian:11.8

EXPOSE 9000

RUN apt-get update && \
    apt-get install -y \
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

WORKDIR /tmp

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz && \
    mkdir -p /var/www/html && \
    mv wordpress /var/www/html && \
    chown -R www-data:www-data /var/www/html/wordpress && \
    chmod -R 777 /var/www/html/wordpress && \
    mkdir -p /run/php

WORKDIR /etc/php/7.4/fpm/pool.d

COPY ./conf/www.conf .

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["php-fpm7.4", "-F"]