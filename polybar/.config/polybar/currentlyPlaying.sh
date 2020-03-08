#/bin/sh

# pulsemixer -l
# pulsemixer --list-sinks

# pulsemixer --id N --get-volume
# pulsemixer --id N --set-volume N
# pulsemixer --id N --set-volume-all N
# pulsemixer --id N --change-volume +-N

# pulsemixer --id N --get-mute
# pulsemixer --id N --mute
# pulsemixer --id N --unmute

main() {
    if ! pgrep -x spotpris2 >/dev/null; then
        echo ""; exit
    fi

    status=$(playerctl -p spotpris status);
    [[ $status = "Playing" ]] && status=
    [[ $status = "Paused" ]] && status=
    artist=$(playerctl -p spotpris metadata artist);
    title=$(playerctl -p spotpris metadata title);

    echo "$status $artist - $title";
}

main "$@"
