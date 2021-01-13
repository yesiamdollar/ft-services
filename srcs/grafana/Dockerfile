FROM alpine

RUN apk update && apk upgrade
copy grafana.tar.gz /tmp
copy glibc-2.32-r0.apk /tmp
copy grafana.sh /

RUN apk add --update ca-certificates && \
    apk add --allow-untrusted /tmp/glibc-2.32-r0.apk && \ 
    rm -rf /tmp/glibc-2.32-r0.apk

RUN tar -xvf /tmp/grafana.tar.gz -C /opt && mv /opt/grafana-7.3.6/ /opt/grafana
EXPOSE 3000
CMD sh grafana.sh