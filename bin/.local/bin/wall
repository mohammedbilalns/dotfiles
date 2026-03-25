#!/usr/bin/env sh
dir="${HOME}/Pictures/walpapers"
BG="$(find "$dir" -name '*.jpg' -o -name '*.png' | shuf -n1)"
Program="swww-daemon"
trans_type="simple"

if pgrep "$PROGRAM" >/dev/null; then
	swww img "$BG" --transition-fps 244 --transition-type $trans_type --transition-duration 1
else
	swww init && swww img "$BG" --transition-fps 244 --transition-type $trans_type --transition-duration 1
fi



