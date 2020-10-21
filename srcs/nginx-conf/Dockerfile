FROM alpine

RUN apk add --no-cache nginx openrc
RUN adduser -D -g 'www' www
RUN mkdir /www ; chown -R www:www /www
RUN mkdir /run/nginx; touch /run/nginx/nginx.pid
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig

COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ./index.html /www/index.html

RUN mkdir /run/openrc\
  && touch /run/openrc/softlevel

CMD ["nginx", "-g", "daemon off;"]
