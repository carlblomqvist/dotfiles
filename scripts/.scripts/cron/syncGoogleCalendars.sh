#!/bin/bash

WGET=/bin/wget
AWK=/bin/awk
CALENDARPATH=/home/carlb/org/agenda/calendar
SCRIPTSPATH=/home/carlb/.scripts/cron
ICS2ORG=$SCRIPTSPATH/ical2org.awk
ICSFILE=$CALENDARPATH/currentCalendar.ics

#.org files
MAINORGFILE=$CALENDARPATH/googleMainCalendar.org
DTEKORGFILE=$CALENDARPATH/googleDtekCalendar.org
TIMEEDITORGFILE=$CALENDARPATH/googleTimeEditCalendar.org

#.ics URLs
# The file calendars holds variables with URLs to .ics files
# calendars has variables MAIN, DATATEKNIK, TIMEEDIT
source $CALENDARPATH/calendars

#create arrays to loop over
declare -a cal=("$MAIN" "$DATATEKNIK" "$TIMEEDIT")

# declare org-files to use for calendar output
declare -A org
org["$MAIN"]=$MAINORGFILE
org["$DATATEKNIK"]=$DTEKORGFILE
org["$TIMEEDIT"]=$TIMEEDITORGFILE

# declare title of calendars
declare -A title
title["$MAIN"]="Main Calendar"
title["$DATATEKNIK"]="Dateteknik"
title["$TIMEEDIT"]="Time Edit"

# declare category for calendars
declare -A category
category["$MAIN"]=""
category["$DATATEKNIK"]="Data"
category["$TIMEEDIT"]="Data"

for i in "${cal[@]}"
do
    $WGET -O $ICSFILE "$i"
    $AWK -v title="${title[$i]}" -v category="${category[$i]}" -f $ICS2ORG $ICSFILE > "${org[$i]}"
done

