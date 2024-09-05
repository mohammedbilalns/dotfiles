#!/bin/bash

while true
do
    # Get battery level percentage
    battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')

    # Get charging status (Charging/Discharging)
    charging_status=$(acpi -b | grep -o 'Charging\|Discharging')

    # Only show notifications if charging
    if [ "$charging_status" = "Charging" ]; then
        if [ "$battery_level" -ge 75 ]; then
            notify-send "Battery is above 75%!" "Charging: ${battery_level}%"
        elif [ "$battery_level" -le 25 ]; then
            notify-send "Battery is below 25%!" "Charging: ${battery_level}%"
        fi
    fi

    # Wait for 5 minutes before checking again
    sleep 300
done

