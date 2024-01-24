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

WORKDIR /tmp

RUN wget https://wordpress.org/latest.tar.gz

RUN tar -xvf latest.tar.gz

RUN mkdir -p /var/www/html

RUN mv wordpress /var/www/html

RUN chown -R www-data:www-data /var/www/html/wordpress

RUN chmod -R 777 /var/www/html/wordpress

RUN mkdir -p /run/php

WORKDIR /etc/php/7.4/fpm/pool.d

COPY ./conf/www.conf .

EXPOSE 9000

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["php-fpm7.4", "-F"]