#! /bin/bash 

hyprctl --batch "$HYPRCMDS"
hyprctl dispatch exec [workspace 1 silent] dolphin /home/mohammedbilalns/Documents/Texts
hyprctl dispatch exec [workspace 1 silent] firefox 
hyprctl dispatch exec [workspace 2 silent] /home/mohammedbilalns/.config/hypr/code.sh


