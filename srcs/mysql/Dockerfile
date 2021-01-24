FROM alpine:3.11


RUN apk add --update mariadb mariadb-client openrc
RUN mkdir /run/openrc\
  && touch /run/openrc/softlevel
COPY setup.sh setup.sh
COPY my.cnf /etc/mysql/my.cnf
COPY mariadb-server.cnf /etc/my.cnf.d/
ADD users.sql /
ADD wordpress_db.sql /
VOLUME ["/var/lib/mysql"]

#COPY telegraf.sh /
#RUN sh telegraf.sh
#COPY telegraf.conf /etc/telegraf/
EXPOSE 3306



ENTRYPOINT sh setup.sh
