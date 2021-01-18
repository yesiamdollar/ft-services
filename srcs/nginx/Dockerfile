FROM alpine:3.11

RUN apk add --no-cache wget nginx openssl openssh
RUN adduser -D -g 'www' www
RUN mkdir /www ; chown -R www:www /www 
RUN openssl req -x509 -nodes -days 365 -subj "/C=MA/ST=BG/O=dollar, Inc./CN=localhost"\
    -addext "subjectAltName=DNS:localhost"\
	-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key\
	-out /etc/ssl/certs/nginx-selfsigned.crt;
RUN mkdir /run/nginx; touch /run/nginx/nginx.pid
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ssh.sh /tmp
RUN sh /tmp/ssh.sh
COPY run.sh /
COPY telegraf.sh /
RUN sh telegraf.sh

COPY telegraf.conf /etc/telegraf
COPY ./index.html /www/index.html
EXPOSE 80 443 22

# CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["sh", "/run.sh"]




