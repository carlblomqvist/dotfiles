#!/bin/sh

#ping -c 1 -q pdupc-pcmetrics.sero.wh.rnd.internal.ericsson.com || printf ""

status=$(curl -s https://epgweb.sero.wh.rnd.internal.ericsson.com/traffic_light/api/getTrafficLight | jq '.data.LSV')

green="\"green\""
yellow="\"yellow\""
if [ "$status" = "$green" ]; then
    printf '%%{F#A3BE8C}%%{F-}' 
elif [ "$status" = "$yellow" ]; then
    printf '%%{F#EBCB8B}%%{F-}' 
else #if red
    printf '%%{F#BF616A}%%{F-}' 
fi
    
    
        
