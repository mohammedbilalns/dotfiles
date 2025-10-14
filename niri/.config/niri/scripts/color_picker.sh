#!/bin/bash

output=$(niri msg pick-color)

# Extract the hex color code (e.g., #584d67)
hex=$(echo "$output" | grep -oE '#[0-9A-Fa-f]{6}')

if [ -z "$hex" ]; then
    echo "No color found in niri output."
    exit 1
fi

zenity_color="${hex:1}"

# Open zenity color picker initialized to the selected color
color=$(zenity --color-selection --color="#$zenity_color" --title="Edit Picked Color")

# If the user picked a color, print it
if [ $? -eq 0 ]; then
    echo "Selected color: $color"
else
    echo "Color selection canceled."
fi

