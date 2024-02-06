#!/bin/sh

wp config create --dbname=$MYSQL_DB_NAME --dbuser=$MYSQL_USER_NAME --dbpass=$MYSQL_USER_PASSWORD --dbhost=$MYSQL_HOST_NAME --allow-root
wp core install --url=$DOMAIN_NAME --title=$TITLE --admin_user=$ADMIN --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_MAIL --allow-root
wp user create $LOGIN $LOGIN_MAIL --user_pass=$LOGIN_PASSWORD --allow-root

echo "\
--------------------
@ wordpress + php-fpm ready
@ port 9000
--------------------"

exec "$@"
