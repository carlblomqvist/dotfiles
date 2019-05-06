bat=$(cat /sys/class/power_supply/BAT1/capacity)
if [ "$bat" -lt 10 ]; then
    notify-send -t 60000 -u critical -i ~/dotfiles/polybar/.config/polybar/lowbatterywhite.png "Battery Level Low: $bat%"
fi
echo ""
