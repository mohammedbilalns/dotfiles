 #!/bin/bash

# Installing base-devel
sudo pacman -S --needed base-devel 

#Installing paru 
if ! command -v paru  &>/dev/null 
then
	echo "installing paru..."
	git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si && cd $HOME
fi
 
# list of applications
apps=("$@")
predefined_apps=( "powertop" "qt6ct" "xdg-user-dirs" "selectdefaultapplication-git" "nemo" "nemo-fileroller" "telegram-desktop" "zathura" "atuin" "zathura-pdf-poppler" "firefox" "ntfs-3g"  "nwg-look" "texlive" "zsh" "xdg-usr-dirs" "neofetch" "htop" "bat" "yazi" "zathura" "zathura-pdf-poppler" "qbitorrent" "gnome-disk-utility" "pipewire" "pipewire-alsa" "pipewire-pulse" "pipewire-media-session" "pipewire-jack"  "gwenview" "bluez" "bluez-utils" "npm" "rnote-bin" "neovim" "python-pynvim" "sassc" "gnome-keyring" "gtk-engine-murrine" "sassc""gnome-themes-extra" "tree-sitter-cli" "papirus-icon-theme" "github-desktop-bin" "pamac-aur" "tlp" "tlp-rdw" "joplin-bin" "fcitx5" "mpv" )

sddm_configuration=("qt6-declarative" "qt6-svg" "sddm" "qt5-quick-controls" "qt5-quickcontrols2" "qt5-graphicaleffects" "sddm-conf-git"  )

hyprland_packages=("waybar" "hyprland-git" "wofi" "hyprlock" "hypridle" "hyprpaper" "hyprshade" "ttf-space-mono-nerd" "ttf-jetbrains-mono""qt5ct" "kvantum" "foot" "brightnessctl" "pamixer" "mako" "blueman" "nwg-look"  "kvantum" "xfce-polkit"  "cliphist" "nwg-clipman")

printing=( "cups" "cups-pdf" "canon-pixma-ts5055-complete")
apps+=("${predefined_apps[@]}")

sddm_check=0
git clone https://github.com/mohammedbilalns/Arch--Hyperland-rice.git
echo -n "Do you want to install sddm configurations? (yes/no)"
read response
if [[ $response =~ ^[Yy][Ee][Ss]$ ]] || [[ $response =~ ^[Yy]$ ]]
then 
	apps+=("${sddm_configuration[@]}")
	echo "copying sddm theme"
	sudo cp -r Arch--Hyperland-rice/sddm /usr/share/sddm/themes/
	sddm_check=1
elif [[ $response =~ ^[Nn][Oo]$ ]] || [[ $response =~ ^[Nn]$ ]]
then
	 continue
else
	echo "Invalid response"
	exit 2
fi
echo -n "Do you want to install hyprland packages? (yes/no)"
read response
if [[ $response =~ ^[Yy][Ee][Ss]$ ]] || [[ $response =~ ^[Yy]$ ]]
then 
	apps+=("${hyprland_packages[@]}")
	echo "copying hyprland configurations... "
	cp -r  Arch--Hyperland-rice/* $HOME/.config/

elif [[ $response =~ ^[Nn][Oo]$ ]] || [[ $response =~ ^[Nn]$ ]]
then
	continue
else
	echo "Invalid response."
	exit 2
fi

echo -n "Do you want to install packages for printing? (yes/no)"
read response
if [[ $response =~ ^[Yy][Ee][Ss]$ ]] || [[ $response =~ ^[Yy]$ ]]
then 
	apps+=("${printing[@]}")
	systemctl enable cups.service
elif [[ $response =~ ^[Nn][Oo]$ ]] || [[ $response =~ ^[Nn]$ ]]
then
	continue
else
	echo "Invalid response."
	exit 2
fi


echo "Installing necessary packages"
for app in "${apps[@]}"; do
    paru  -S --noconfirm "$app"
done
 systemctl enable bluetooth.service 
 systemctl enable tlp.service
 xdg-user-dirs-update                                     
if [ sddm_check==1 ]
then 
	echo "Change sddm theme through sddm-conf-git"
fi

