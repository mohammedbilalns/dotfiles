#!/usr/bin/env sh
if pgrep swayidle
then
	killall swayidle & notify-send "Idle inhibitor is active"
else 
	swayidle -w & notify-send "Idle inhibitor deactivated"
fi

