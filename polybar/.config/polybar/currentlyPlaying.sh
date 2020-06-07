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

    player=$(playerctl -l | grep spotpris | tr '\n' ' ' | cut -d' ' -f 2)

    status=$(playerctl -p "$player" status);
    if [ $status != "Stopped" ]; then
        [[ $status = "Playing" ]] && status=
        [[ $status = "Paused" ]] && status=
        artist=$(playerctl -p "$player" metadata artist);
        title=$(playerctl -p "$player" metadata title);

        echo "$status $artist - $title";
    else
        echo "";
    fi

}

main "$@"
