#!/bin/bash

scrot /tmp/lockscreen.png
#convert /tmp/lockscreen.png -blur 0x8 lockscreen_blur.png
convert /tmp/lockscreen.png -paint 8 /tmp/lockscreen_blur.png
i3lock -n -i /tmp/lockscreen_blur.png
