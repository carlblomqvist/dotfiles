#!/bin/bash

TIDAL_HOST="http://localhost:47836"
STATUS=""

function httpGet() {
  curl -s "$TIDAL_HOST/$1"
}

function httpSilentGet() {
  curl -s -o /dev/null "$TIDAL_HOST/$1"
}

tidal_play() {
  httpSilentGet play
}

tidal_pause() {
  httpSilentGet pause
}

tidal_playpause() {
  httpSilentGet playpause
}

tidal_next() {
  httpSilentGet next
}

tidal_previous() {
  httpSilentGet previous
}

tidal_info() {
  JSON=$(httpGet current)
  TITLE=$(echo "$JSON" | jq -r '.title')
  ARTISTS=$(echo "$JSON" | jq -r '.artist')
  INFO=$(echo "$TITLE - $ARTISTS")
  if [ ${#INFO} -le 3 ]; then
    echo "No music info available"
  else
    echo "$INFO"
  fi
}

tidal_status() {
  if httpGet current | grep "paused" >/dev/null; then
    STATUS=""
  else
    STATUS=""
  fi
}

convertsecs_spotify() {
    #echo ${1}
    #local t=$(bc <<< "${1}/3600000000")
    local h=$(bc <<< "${1}/3600000000")
    local m=$(bc <<< "${1}/60000000")
    local s=$(bc <<< "(${1}%60000000)/1000000")
    if [ "$h" -eq "0"  ]; then
        printf "%02d:%02d\n" $m $s;
    else
        printf "%02d:%02d:%02d\n" $h $m $s;
    fi
}

convertsecs_tidal() {
    local h=$(bc <<< "${1}/3600")
    local m=$(bc <<< "(${1}%3600)/60")
    local s=$(bc <<< "${1}%60")
    if [[ "$h" -eq "0"  ]]; then
        printf "%02d:%02d\n" $m $s;
    else
        printf "%02d:%02d:%02d\n" $h $m $s;
    fi
}

playing_print() {
    player=$(playerctl -l | grep spotify)

    if [ -z "$player" ]; then
        # Tidal-Hifi
        player=$(playerctl -l | grep "tidal-hifi")
        tidal_status
        JSON=$(httpGet current)
        TITLE=$(echo "$JSON" | jq -r '.title')
        ARTISTS=$(echo "$JSON" | jq -r '.artist')
        CURRENT_TIME=$(echo "$JSON" | jq -r '.current')
        DURATION=$(echo "$JSON" | jq -r '.duration')
        # tidal-hifi reports half the duration for some reason, so multiply by 2
        #IFS=: read -r minute second <<< "$DURATION"
        #seconds=$(((minute * 60 + second) * 2))
        #DURATION_FIX=$(convertsecs_tidal "$seconds")

        # Finish - print all info
        echo "$STATUS $ARTISTS - $TITLE ($CURRENT_TIME / $DURATION)";
        exit
    fi

    # Spotify
    status=$(playerctl -p "$player" status);
    if [ $status != "Stopped" ]; then
        [[ $status = "Playing" ]] && status=
        [[ $status = "Paused" ]] && status=
        artist=$(playerctl -p "$player" metadata artist);
        title=$(playerctl -p "$player" metadata title);
        length=$(convertsecs_spotify $(playerctl -p spotify metadata mpris:length))

        echo "$status $artist - $title ($length)";
    else
        echo "";
    fi

}

playing_toggle() {
    player=$(playerctl -l | grep spotify)
    if [ -z "$player" ]; then
        # Tidal Chromium player
        player=$(playerctl -l | grep "chromium.instance")
    fi
    playerctl -p "$player" play-pause
}

playing_get_url() {
    player=$(playerctl -l | grep spotify)
    playerctl -p "$player" metadata xesam:url | xclip -selection clipboard
}

case "$1" in
    --toggle)
        playing_toggle
        ;;
    --get-url)
        playing_get_url
        ;;
    *)
        playing_print
        ;;
esac
