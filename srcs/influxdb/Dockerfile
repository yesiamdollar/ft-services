from alpine:3.11

run apk update
run apk add influxdb openrc --no-cache
run mkdir /run/openrc\
  && touch /run/openrc/softlevel

expose 8086
CMD influxd
