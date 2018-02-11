#!/bin/bash

DATE=$(echo `date '+%Y-%m-%d-%H:%M:%S'`.jpg)
FILE=home/carlb/pictures/screenshots/"$DATE"

if [ "$1" = "-s" ]
then
    scrot -s ~/pictures/screenshots/"$DATE"
    notify-send "Screenshot Saved as $DATE"
else
    scrot ~/pictures/screenshots/"$DATE"
    notify-send "Screenshot Saved as $DATE"
fi
