FROM alpine:3.11

RUN apk add --no-cache nginx openrc tar wget bash
RUN adduser -D -g 'www' www
RUN mkdir /www ; chown -R www:www /www
RUN mkdir /run/nginx; touch /run/nginx/nginx.pid
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
RUN apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype
COPY ./nginx.conf /etc/nginx/nginx.conf
RUN cd /tmp ; wget https://wordpress.org/latest.tar.gz ; cd ..
ADD wp-config.php /


RUN tar -C /tmp/ -xvf /tmp/latest.tar.gz

RUN cp -rf /tmp/wordpress/* /www/
RUN cp /wp-config.php /www/
RUN mkdir /run/openrc\
  && touch /run/openrc/softlevel

COPY run.sh /


EXPOSE 5050
ENTRYPOINT ["bash", "/run.sh"]



#CMD ["nginx", "-g", "daemon off;"]
