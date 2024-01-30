FROM debian:11.8

EXPOSE 3306

RUN apt-get update && \
    apt-get install -y \
    dumb-init \
    mariadb-server \
    mariadb-client && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    rm -f /etc/mysql/mariadb.conf.d/50-server.cnf
    # /run /var/run 연관관계 좀 더 명확하게 확인하기

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

WORKDIR /tmp

COPY ./tools/mariadb_setup.sh .

RUN chmod +x mariadb_setup.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["sh", "mariadb_setup.sh"]