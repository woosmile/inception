FROM debian:11.8

EXPOSE 9000

RUN apt-get update && \
    apt-get install -y \
    dumb-init \
    wget \
    curl \
    php7.4 \
    php-fpm \
    php-mysql \
    psmisc \
    tree

WORKDIR /tmp

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html && \
    mv wordpress /var/www/html && \
    chown -R www-data:www-data /var/www/html/wordpress && \
    chmod -R 777 /var/www/html/wordpress && \
    mkdir -p /var/run/php

WORKDIR /etc/php/7.4/fpm/pool.d

COPY ./conf/www.conf .

WORKDIR /var/www/html/wordpress

COPY ./tools/wordpress_setup.sh .

RUN chmod 777 wordpress_setup.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--", "/var/www/html/wordpress/wordpress_setup.sh"]

CMD ["php-fpm7.4", "-F"]
