#!/bin/bash
# Default acpi script that takes an entry for all actions

case "$1" in
    cd/play)
        case "$2" in
            CDPLAY)
                logger 'PlayPauseButton pressed'
                # /usr/bin/sudo -u carlb playerctl play-pause
                #/usr/bin/amixer set Speaker on
                #/usr/bin/amixer set Headphone on
                sudo -u carlb amixer set Master toggle
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    button/mute)
        case "$2" in
            MUTE)
                logger 'MuteButton pressed'
                /usr/bin/amixer set Speaker on
                /usr/bin/amixer set Headphone on
                #/usr/bin/sudo -u carlb amixer set Master toggle
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    button/volumeup)
        case "$2" in
            VOLUP)
                logger 'VolumeUp pressed'
                # /usr/bin/sudo -u carlb amixer set Master 5+
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    button/volumedown)
        case "$2" in
            VOLDN)
                logger 'VolumeDown pressed'
                # /usr/bin/sudo -u carlb amixer set Master 5-
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    video/brightnessup|video/brightnessdown)
        case "$2" in
            BRTDN)
				#backlight -10%
                logger 'BrightnessDownButton pressed'
                ;;
            BRTUP)
                logger 'BrightnessUpButton pressed'
                #backlight +10%
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    button/power)
        case "$2" in
            PBTN|PWRF)
                logger 'PowerButton pressed'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    button/sleep)
        case "$2" in
            SLPB|SBTN)
                logger 'SleepButton pressed'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0)
                case "$4" in
                    00000000)
                        logger 'AC unpluged'
                        ;;
                    00000001)
                        logger 'AC pluged'
                        ;;
                esac
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    battery)
        case "$2" in
            BAT0)
                case "$4" in
                    00000000)
                        logger 'Battery online'
                        ;;
                    00000001)
                        logger 'Battery offline'
                        ;;
                esac
                ;;
            CPU0)
                ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac
        ;;
    button/lid)
        case "$3" in
            close)
                logger 'LID closed'
                ;;
            open)
                logger 'LID opened'
		setxkbmap se
                ;;
            *)
                logger "ACPI action undefined: $3"
                ;;
    esac
    ;;
    *)
        logger "ACPI group/action undefined: $1 / $2"
        ;;
esac

# vim:set ts=4 sw=4 ft=sh et:
