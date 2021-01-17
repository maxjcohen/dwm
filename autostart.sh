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

    # Date
    status+="  $(date '+%a %d %b')"

    # Time
    status+="  $(date '+%R')"


    xsetroot -name "$status"
    sleep 1
done &

# Restore background image
nitrogen --restore &
