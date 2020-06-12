#!/bin/sh

dpms=$(xset -q | grep 'DPMS is' | cut -d' ' -f 5)

sleep_toggle() {
    if [ "$dpms" == "Disabled" ];
    then
        xset s on +dpms
        killall -SIGUSR2 dunst
    else
        xset s off -dpms
        killall -SIGUSR1 dunst
    fi
}

sleep_print() {
    if [ "$dpms" == "Disabled" ];
    then
        printf "%%{F#BF616A}零%%{F-}"
    else
        printf "鈴"
    fi
}

case $1 in
    "--toggle")
        sleep_toggle
        sleep_print
        ;;
    "--suspend")
        systemctl suspend
        ;;
    *)
        sleep_print
        ;;
esac
