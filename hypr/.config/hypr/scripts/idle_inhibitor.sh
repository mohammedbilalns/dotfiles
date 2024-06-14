#!/usr/bin/env sh

if pgrep hypridle 
then
	killall hypridle & notify-send "Idle inhibitor is active"
else 
	hypridle & notify-send "Idle inhibitor deactivated"
fi
