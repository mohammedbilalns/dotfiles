#!/usr/bin/env bash

if pgrep wlsunset 
then
	killall wlsunset
else
	wlsunset -T 5700
fi
