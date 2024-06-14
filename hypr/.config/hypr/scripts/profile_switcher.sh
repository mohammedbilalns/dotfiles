#!/usr/bin/env sh 
waybar_config=$HOME/dotfiles/.config/waybar/config.jsonc
hyprland_config=$HOME/dotfiles/.config/hypr/hyprland.conf

if grep -q  "Net" "$hyprland_config" 
then
	#Replacing waybar config 
	sed -i 's/Files/Browser/g' $waybar_config
	sed -i 's/TeX/Youtube/g' $w:aybar_config
	sed -i 's/Rnote/ChatGPT/g' $waybar_config
	sed -i 's/"4": "Video",//g' $waybar_config
	sed -i 's/"5": "Browser",//g' $waybar_config
	sed -i 's/"6": "ChatGPT",//g' $waybar_config

	#Replacing Hyprland config	
	sed -i 's/Net/codingprof/g' $hyprland_config
	sed -i 's/workspace = 1, on-created-empty: nemo//g' $hyprland_config
	sed -i 's/workspace = 2, on-created-empty: foot nvim//g' $hyprland_config
	sed -i 's/workspace = 3, on-created-empty: rnote//g' $hyprland_config
	sed -i 's/workworspace = 4/workspace = 2/g' $hyprland_config
	sed -i 's/workspace = 5/workspace = 1/g' $hyprland_config
	sed -i 's/workspace = 6/workspace = 3/g' $hyprland_config
	
	killall waybar && waybar  & notify-send "Profile switched to coding"
 
fi

if grep -q  "codingprof" "$hyprland_config" 
then
	#Replacing waybar config
	
	sed -i 's/codingprof/Net/g' $hyprland_config
	sed -i 's/Browser/Files/g' $waybar_config
	sed -i 's/Youtube/TeX/g' $waybar_config
	sed -i 's/ChatGPT/Rnote/g' $waybar_config:q

	sed -i '/"3": "Rnote",/a\    "4": "Video",' $waybar_config
	sed -i '/"4": "Video",/a\    "5": "Browser",' $waybar_config
	sed -i '/"5": "Browser",/a\   "6": "ChatGPT",' $waybar_config
	

	#Replacing Hyprland config	
	sed -i 's/workspace = 2/workspace = 4/g' $hyprland_config
	sed -i 's/workspace = 1/workspace = 5/g' $hyprland_config
	sed -i 's/workspace = 3/workspace = 6/g' $hyprland_config
	sed -i '/# Workspace rule/a\     workspace = 1, on-created-empty: nemo' $hyprland_config

	sed -i '/workspace = 1, on-created-empty: nemo/a\     workspace = 2, on-created-empty: foot nvim' $hyprland_config
	sed -i '/workspace = 2, on-created-empty: foot nvim/a\     workspace = 3, on-created-empty: rnote' $hyprland_config

	
	notify-send "Profile switched to Net"


	killall waybar && waybar

fi


