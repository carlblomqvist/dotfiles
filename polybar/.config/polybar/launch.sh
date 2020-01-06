#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch one bar on every screen
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m nohup polybar -r main -c ~/.config/polybar/config.ini > /dev/null 2>&1 &
    done
else
    nohup polybar -r main -c ~/.config/polybar/config.ini > /dev/null 2>&1 &
fi
