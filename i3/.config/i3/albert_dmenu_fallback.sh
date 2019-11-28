#!/bin/bash

res=$(awk '{print $1*1000}' /proc/uptime)

if [ $res -lt 55000 ]; then
   dmenu_run
else
   albert toggle
fi
