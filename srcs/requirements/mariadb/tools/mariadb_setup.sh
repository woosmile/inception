#!/bin/sh

if [ ! -d "/var/lib/mysql/$MYSQL_DB_NAME" ]; then
    mysql_install_db --datadir=/var/lib/mysql --auth-root-authentication-method=normal > /dev/null
    mysqld --bootstrap << EOF
    use mysql;
    flush privileges;
    create database $MYSQL_DB_NAME;
    create user '$MYSQL_USER_NAME'@'%' identified by '$MYSQL_USER_PASSWORD';
    grant all privileges on $MYSQL_DB_NAME.* to '$MYSQL_USER_NAME'@'%';
    alter user '$MYSQL_ROOT_NAME'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';
    flush privileges;
EOF
    chown -R mysql:mysql /var/lib/mysql && \
    chmod -R 777 /var/lib/mysql
fi

exec "$@"