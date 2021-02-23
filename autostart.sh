# Set status bar to display current time
while true; do
    status=""

    # Available memory
    total_mem=$(free | grep Mem | sed 's/ \+/ /g' | cut -d' ' -f2)
    used_mem=$(free | grep Mem | sed 's/ \+/ /g' | cut -d' ' -f3)
    percent=$(echo "$used_mem/$total_mem*100" | bc -l | cut -d. -f1)
    status+="  $percent%"

    # Wifi
    wifi_status=$(iw dev | grep ssid | cut -d' ' -f2)
    if [ $wifi_status ]; then
        status+="  $wifi_status"
    fi

    # Battery level
    battery_level="$(cat /sys/class/power_supply/BAT0/capacity)"
    if [ $(cat /sys/class/power_supply/BAT0/status) = "Charging" ]; then
        battery_icon=""
    elif [ $battery_level -gt 90 ]; then
        battery_icon=""
    elif [ $battery_level -gt 75 ]; then
        battery_icon=""
    elif [ $battery_level -gt 50 ]; then
        battery_icon=""
    elif [ $battery_level -gt 25 ]; then
        battery_icon=""
    else
        battery_icon=""
    fi
    status+=" $battery_icon $battery_level%"

    # Volume level
    volume_level="$(pulsemixer --get-volume | cut -d' ' -f1)"
    if [ $volume_level -gt 66 ]; then
        volume_icon=""
    elif [ $volume_level -gt 33 ]; then
        volume_icon=""
    else
        volume_icon=""
    fi

    if [ $(pulsemixer --get-mute) -eq 1 ]; then
        volume_icon=""
    fi

    status+=" $volume_icon $volume_level%"

    # Date
    status+="  $(date '+%a %d %b')"

    # Time
    status+="  $(date '+%R')"


    xsetroot -name "$status"
    sleep 10
done &

# Restore background image
nitrogen --restore &
redshift -l 48.51:2.20 &
