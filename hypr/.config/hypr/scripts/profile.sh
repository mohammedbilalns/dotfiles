 #!/usr/bin/env sh 
waybar_config=$HOME/.config/waybar/config.jsonc
workspace_config=$HOME/.config/hypr/workspaces.conf
waybar_profile_net=$HOME/.config/hyprProfiles/waybarconfig/confignet.jsonc
waybar_profile_coding=$HOME/.config/hyprProfiles/waybarconfig/configcod.jsonc
waybar_profile_default=$HOME/.config/hyprProfiles/waybarconfig/configdef.jsonc
workspace_profile_net=$HOME/.config/hyprProfiles/workspacerules/workspacenet.conf
workspace_profile_coding=$HOME/.config/hyprProfiles/workspacerules/workspacecoding.conf 
workspace_profile_default=$HOME/.config/hyprProfiles/workspacerules/workspacedef.conf 



if grep -q  "default" "$workspace_config" 
then
	cp $workspace_profile_coding $workspace_config
	cp $waybar_profile_coding $waybar_config
	killall waybar && waybar &	notify-send "Switched to Coding"
elif  grep -q  "codingprof" "$workspace_config" 
then
	cp $workspace_profile_net $workspace_config
	cp $waybar_profile_net $waybar_config
	killall waybar && waybar &	notify-send "Switched to Net"
elif grep -q "Net" "$workspace_config"
then
	cp $workspace_profile_default $workspace_config
	cp $waybar_profile_default $waybar_config
	killall waybar && waybar & notify-send "Switched to Default"

fi
