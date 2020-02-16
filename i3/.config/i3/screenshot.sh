#!/bin/bash

DATE=$(echo `date '+%Y-%m-%d-%H:%M:%S'`.jpg)
FILE=home/carlb/pictures/screenshots/"$DATE"
copy_and_delete='sh -c "xclip -selection clipboard -t image/png -i $f; rm $f"'

if [ "$1" = "-s" ]
then
    if [ "$2" = "-c" ]
    then
        scrot -f -s -e "$copy_and_delete"
        continue
    else
        bindsym --release $mod+Shift+p exec
        scrot -s ~/pictures/screenshots/"$DATE"
        notify-send "Screenshot Saved as $DATE"
    fi
else
    scrot ~/pictures/screenshots/"$DATE"
    notify-send "Screenshot Saved as $DATE"
fi
