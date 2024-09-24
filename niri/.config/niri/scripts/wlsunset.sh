#!/usr/bin/env bash

if pgrep wlsunset 
then
	killall wlsunset
else
	wlsunset -t 5600
fi
