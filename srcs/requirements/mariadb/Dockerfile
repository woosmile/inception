FROM debian:11.8

EXPOSE 3306

RUN apt-get update && \
    apt-get install -y \
    dumb-init \
    mariadb-server \
    mariadb-client \
    psmisc \
    tree && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    rm -f /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

WORKDIR /tmp

COPY ./tools/mariadb_setup.sh .

RUN chmod +x mariadb_setup.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--", "/tmp/mariadb_setup.sh"]

CMD ["mysqld", "--datadir=/var/lib/mysql"]