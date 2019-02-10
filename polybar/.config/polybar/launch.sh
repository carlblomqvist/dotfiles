#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
# nohup polybar bar > /dev/null 2>&1 &
# nohup polybar bar2 > /dev/null 2>&1 &
# nohup polybar bottombar > /dev/null 2>&1 &
# nohup polybar topbar > /dev/null 2>&1 &

# Launch bar
# nohup polybar top > /dev/null 2>&1 &

# Launch one bar on every screen
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m nohup polybar top > /dev/null 2>&1 &
    done
else
    nohup polybar top > /dev/null 2>&1 &
fi
