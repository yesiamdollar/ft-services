FROM alpine:3.11


RUN apk add --update mariadb mariadb-client openrc bash
RUN mkdir /run/openrc\
  && touch /run/openrc/softlevel
COPY setup.sh setup.sh
COPY my.cnf /etc/mysql/my.cnf
COPY mariadb-server.cnf /etc/my.cnf.d/
ADD users.sql /
ADD wordpress_db.sql /
VOLUME ["/var/lib/mysql"]
EXPOSE 3306



CMD ["bash", "setup.sh"]
