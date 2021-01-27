from alpine:3.11

run apk update
run apk add influxdb openrc --no-cache bash
run mkdir /run/openrc\
  && touch /run/openrc/softlevel
copy telegraf.sh /
run sh telegraf.sh
copy telegraf.conf /etc/telegraf
copy run.sh /
expose 8086

ENTRYPOINT ["bash", "/run.sh"]

