FROM alpine:3.11

RUN apk update && apk upgrade && apk add wget
RUN wget https://dl.grafana.com/oss/release/grafana-7.0.5.linux-amd64.tar.gz -O /tmp/grafana.tar.gz
copy glibc-2.32-r0.apk /tmp
copy grafana.sh /

RUN apk add --update ca-certificates && \
    apk add --allow-untrusted /tmp/glibc-2.32-r0.apk && \ 
    rm -rf /tmp/glibc-2.32-r0.apk

RUN tar -xvf /tmp/grafana.tar.gz -C /opt && mv /opt/grafana-*/ /opt/grafana
COPY telegraf.sh /
RUN sh telegraf.sh

EXPOSE 3000
CMD sh grafana.sh
