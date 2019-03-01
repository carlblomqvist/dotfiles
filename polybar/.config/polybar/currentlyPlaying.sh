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
    if ! pgrep -x spotify >/dev/null; then
        echo ""; exit
    fi

    status=$(playerctl status);
    [[ $status = "Playing" ]] && status=
    [[ $status = "Paused" ]] && status=
    artist=$(playerctl metadata artist);
    title=$(playerctl metadata title);

    echo "$status $artist - $title";
}

main "$@"
