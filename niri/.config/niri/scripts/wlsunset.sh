#!/usr/bin/env bash

if pgrep gammastep 
then
	killall gammastep
else
	gammastep -O 5600
fi
