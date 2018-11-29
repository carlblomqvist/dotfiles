#!/bin/sh

percentage="%"
battery=$(python ~/.config/polybar/mshw0084-rqst.py bat1.pretty | grep Precentage | grep -Eo '[[:digit:]]' | paste -s -d "" -)
battery_status=$(python ~/.config/polybar/mshw0084-rqst.py bat1.pretty | grep State | cut -d " " -f 3)
battery_icon="none"
if [ ! -z "$battery" ]; then
    if [ "$battery_status" = "'Charging'," ]; then
        battery_icon=""
    elif [ "$battery" -gt "85" ]; then
        battery_icon=""
    elif [ "$battery" -gt "60" ]; then
        battery_icon=""
    elif [ "$battery" -gt "40" ]; then
        battery_icon=""
    elif [ "$battery" -gt "10" ]; then
        battery_icon=""
    else
        battery_icon=""
    fi
fi

echo "$battery_icon" "$battery$percentage"
