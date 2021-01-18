FROM alpine:3.11

RUN apk add --no-cache wget nginx openrc tar
RUN adduser -D -g 'www' www
RUN mkdir /www ; chown -R www:www /www
RUN mkdir /run/nginx; touch /run/nginx/nginx.pid
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
RUN apk add php7-fpm php7-mbstring php7-session php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./pma.tar.gz /tmp/

RUN tar -C /tmp/ -xvf /tmp/pma.tar.gz 
RUN cp -rf /tmp/pma/* /www/
ADD config.inc.php /
RUN cp /config.inc.php /www/
RUN mkdir /www/tmp/
RUN chmod 777 /www/tmp

RUN mkdir /run/openrc\
  && touch /run/openrc/softlevel

COPY telegraf.sh /
RUN sh telegraf.sh
COPY telegraf.conf /etc/telegraf
EXPOSE 80

CMD php-fpm7 -R && nginx -g "daemon off;"



#CMD ["nginx", "-g", "daemon off;"]
