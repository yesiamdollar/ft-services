#!/bin/bash

influxd&
telegraf&

sleep 20s

while [ 1 -eq 1 ]; do
	val=`ps`
	if [[ ! "$val" =~ "telegraf" ]] || [[ ! "$val" =~ "influxd" ]]; then
        break
    fi
done