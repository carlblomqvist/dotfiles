#!/bin/sh

get_icon() {
    case $1 in
        01d) icon="";;
        01n) icon="";;
        02d) icon="";;
        02n) icon="";;
        03*) icon="";;
        04*) icon="";;
        09d) icon="";;
        09n) icon="";;
        10d) icon="";;
        10n) icon="";;
        11d) icon="";;
        11n) icon="";;
        13d) icon="";;
        13n) icon="";;
        50d) icon="";;
        50n) icon="";;
        *) icon="";
    esac

    echo $icon
}

KEY="a4cdf76581306c21f39fee5c902637d4"
CITY="2711537"
UNITS="metric"
SYMBOL="°"

if [ ! -z $CITY ]; then
    weather=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?APPID=$KEY&id=$CITY&units=$UNITS")
    # weather=$(curl -sf "http://api.openweathermap.org/data/2.5/forecast?APPID=$KEY&id=$CITY&units=$UNITS&cnt=1")
else
    location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

    if [ ! -z "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        weather=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
    fi
fi

if [ ! -z "$weather" ]; then
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    temp_max=$(echo "$weather" | jq ".main.temp_max" | cut -d "." -f 1)
    temp_min=$(echo "$weather" | jq ".main.temp_min" | cut -d "." -f 1)
    weather_icon=$(echo "$weather" | jq -r ".weather[].icon")
    wind_speed=$(echo "$weather" | jq ".wind.speed" | cut -d "." -f 1)
    sunrise=$(echo "$weather" | jq ".sys.sunrise" | cut -d " " -f 5 | cut -d ":" -f 1,2)
    sunrisee=$(echo `date -d @$sunrise` | cut -d " " -f 4 | cut -d ":" -f 1,2)
    sunset=$(echo "$weather" | jq ".sys.sunset" )
    sunsett=$(echo `date -d @$sunset` | cut -d " " -f 4 | cut -d ":" -f 1,2)

    echo "$(get_icon "$weather_icon")" "$weather_temp$SYMBOL" " $temp_min/$temp_max" " $wind_speed m/s" " $sunrisee $sunsett" 
fi
