#!/bin/sh
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
tar -xzf telegraf-1.13.3-static_linux_amd64.tar.gz
chmod +x telegraf/*
cp telegraf/telegraf /usr/bin/
mkdir etc/telegraf
