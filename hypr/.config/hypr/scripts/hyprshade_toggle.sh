#!/bin/bash
check_active=$(hyprshade current)
if echo "$check_active" | grep -q "blue-light-filter"; then
	hyprshade off
else
	hyprshade on blue-light-filter
fi
