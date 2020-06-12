bat=$(cat /sys/class/power_supply/BAT0/capacity)
stat=$(cat /sys/class/power_supply/BAT0/status)
if [ "$bat" -lt 10 ]; then
    if [ "$stat" != "Charging" ]; then
    notify-send -t 60000 -u critical -i ~/dotfiles/polybar/.config/polybar/scripts/lowbatterywhite.png "Battery Level Low: $bat%"
    fi
fi
echo ""
