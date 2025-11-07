#!/bin/bash

# Check if waybar is running
if pgrep -x "waybar" > /dev/null
then
    # If waybar is running, kill it
    echo "Killing waybar..."
    pkill waybar
	
else
    # If waybar is not running, start it
    echo "Starting waybar..."
    waybar -c ~/.config/niri/waybar/config.jsonc -s ~/.config/niri/waybar/style.css &

fi

