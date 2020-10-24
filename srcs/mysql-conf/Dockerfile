FROM alpine

WORKDIR /work

RUN apk add --update mysql mysql-client 

COPY setup.sh setup.sh
COPY my.cnf /etc/mysql/my.cnf

EXPOSE 3306

CMD sh setup.sh