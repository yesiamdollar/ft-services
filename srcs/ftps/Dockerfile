FROM alpine:3.11


RUN apk add  openssl
RUN apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache


RUN adduser -D dollar && echo -e "1234aa\n1234aa\n" | passwd dollar
ENV PURE_PATH=/etc/ssl/private
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $PURE_PATH/pure-ftpd.key -out $PURE_PATH/pure-ftpd.crt -subj "/C=MA/ST=benguerir/L=maroc/O=1337/OU=1337/CN=localhost"
RUN cat $PURE_PATH/pure-ftpd.key $PURE_PATH/pure-ftpd.crt > $PURE_PATH/pure-ftpd.pem
RUN echo $'TLS                         2\nTLSCipherSuite               HIGH:MEDIUM:+TLSv1:!SSLv2:!SSLv3\nCertFile                     /etc/ssl/private/pure-ftpd.pem' >> /etc/pure-ftpd.conf
RUN chmod 600 $PURE_PATH/pure-ftpd.pem
EXPOSE 21 30000:30009

COPY telegraf.sh /
RUN sh telegraf.sh

COPY ./ftps.sh /ftps.sh

CMD sh ftps.sh
