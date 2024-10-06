# dotfiles
Wayland Compositor Dotfiles Collection

This repository contains my personal dotfiles for three Wayland compositors:

- [Niri](https://github.com/YaLTeR/niri)
- [Hyprland](https://hyprland.org/)
- [SwayFX](https://github.com/WillPower3309/swayfx)

# Preview 

### Niri 



https://github.com/user-attachments/assets/04ee833e-7956-4b22-9ba2-3365d3dd7bde




# Installation 
> [!NOTE]
> This instruction if for installing on Arch-based distros. Choose packages according to your distribution

> [!NOTE]
>I've used Paru as the AUR helper in the following commands, but feel free to use your AUR helper of choice.

> [!WARNING]
> Make sure to backup your previous configurations, as this process may cause you to lose them

1. clone the Repository `git clone https://github.com/mohammedbilalns/dotfiles`
2. configure compositors accordingly 
## Niri  

```
paru -S stow niri mako foot swayidle swaylock-effects fuzzel waybar wlsunset swaybg &&
mv .config/niri .config/mako .config/foot .config/swayidle .config/swaylock .config/fuzzel .config/backup/ &&
cd dotfiles && stow niri mako swayidle swaylock fuzzel 
```

## Hyprland 


```
paru -S stow hyprland hyprlock hypridle hyprpaper hyprshade hyprpicker mako waybar foot fuzzel 
mv .config/hypr .config/mako .config/foot .config/fuzzel .config/backup/ &&
cd dotfiles && stow hypr mako wayar fuzzel 
```
## Swayfx 


```
paru -S stow swayfx mako foot swayidle swaylock-effects fuzzel waybar wlsunset swaybg
mv .config/sway .config/mako .config/foot .config/swayidle .config/swaylock .config/fuzzel .config/backup/ &&
cd dotfiles && stow sway mako swayidle swaylock fuzzel 
```






