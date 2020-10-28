FROM alpine

RUN apk add --no-cache nginx openssl
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




COPY ./index.html /www/index.html
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]





