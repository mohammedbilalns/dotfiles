#!/usr/bin/env bash

case "$1" in 
focus-workspace)
    niri msg action "$@" && pkill -SIGRTMIN+8 waybar;;
*)
	set -e

	monitor=$1

	active=""
	inactive=""

	workspace_str=""

	msg_out="$(niri msg -j workspaces | jq ".[] | select(.output == \"$monitor\") | .is_active")"
	for ws in $msg_out; do
		if "$ws"; then
			workspace_str="${workspace_str}${active}  "
		else
			workspace_str="${workspace_str}${inactive}  "
		fi
	done

	printf "%s" "$workspace_str"
esac
