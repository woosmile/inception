# !/bin/bash

wget https://wordpress.org/latest.tar.gz

tar -xvf latest.tar.gz

mkdir -p /var/www/html

mv /tmp/wordpress/* /var/www/html/wordpress

sudo chown -R www-data:www-data /var/www/html/wordpress

sudo chmod -R 755 /var/www/html/wordpress

mkdir -p /run/php

php-fpm7.4 -F