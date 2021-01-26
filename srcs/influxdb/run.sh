#!/bin/bash

influxd&
telegraf&

val=`ps`

if [[ ! "$val" =~ "influxd" ]]; then
		influxd&
fi

if [[ ! "$val" =~ "telegraf" ]]; then
		telegraf&
fi

while [ 1 -eq 1 ]; do
	val=`ps`
	if [[ ! "$val" =~ "telegraf" ]] && [[ ! "$val" =~ "influxd" ]]; then
          break ;
    fi
done