#!/bin/bash

# This script is used to sync .ics files (for example from Google Calendar) with
# your agenda calendar in org-mode. It uses a script written by Eric S Fraga
# Read https://orgmode.org/worg/org-tutorials/org-google-sync.html for more info
# Make sure to set your name, email and other settings in that script!

# To get started, set CALENDARPATH and set variables in a file called
# "calendars" which holds URLs to your remote .ics files.

WGET=/bin/wget
AWK=/bin/awk
CALENDARPATH=/home/carlb/org/agenda/calendar
ICS2ORG=/home/carlb/.scripts/cron/ical2org.awk
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

