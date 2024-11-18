#!/bin/bash

DATE=$(echo `date '+%Y-%m-%d-%H:%M:%S'`.jpg)
copy_and_delete='sh -c "xclip -selection clipboard -t image/png -i $f; rm $f"'

if [ "$1" = "-s" ]
then
    if [ "$2" = "-c" ]
    then
        scrot -s -e "$copy_and_delete"
    else
	#echo "ja"
        #bindsym --release $mod+Shift+p exec
        scrot ~/Pictures/screenshots/"$DATE"
        notify-send "Screenshot Saved as $DATE"
    fi
else
    scrot ~/Pictures/screenshots/"$DATE"
    notify-send "Screenshot Saved as $DATE"
fi
