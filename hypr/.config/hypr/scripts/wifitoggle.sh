#!/bin/bash

# Check current Wi-Fi status
wifi_status=$(nmcli radio wifi)

if [ "$wifi_status" = "enabled" ]; then
    echo "Wi-Fi is currently enabled. Disabling Wi-Fi..."
    nmcli radio wifi off
    notify-send "Wi-Fi has been disabled."
else
    echo "Wi-Fi is currently disabled. Enabling Wi-Fi..."
    nmcli radio wifi on
    notify-send "Wi-Fi has been enabled."
fi

