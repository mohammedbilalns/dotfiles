
# Dotfiles 

This repository contains my personal dotfiles for three Wayland compositors:  

- [Niri](https://github.com/YaLTeR/niri)  
- [SwayFX](https://github.com/WillPower3309/swayfx)  

## 📸 Preview  

### Niri  


https://github.com/user-attachments/assets/bd963331-7df0-47c6-96f5-e1357c816439


## 🛠 Setup & Installation  

This repository is managed using [`stow`](https://www.gnu.org/software/stow/), a symlink manager. To install the dotfiles for a specific compositor, run:  

```sh
stow <compositor-name>
```

For example, to set up Niri:  

```sh
stow niri mako swayidle swaylock fuzzel
```

---

## 🖥️ Compositor-Specific Configurations  

### 🟢 Niri  

#### 🔗 Dependencies  
```sh
niri stow mako foot swayidle swaylock-effects fuzzel waybar gammastep swaybg
```

#### 📦 Install  
```sh
stow niri mako swayidle swaylock fuzzel
```


---

### 🔴 SwayFX  

#### 🔗 Dependencies  
```sh
stow swayfx mako swayidle swaylock-effects fuzzel waybar wlsunset swaybg
```

#### 📦 Install  
```sh
stow sway mako swayidle swaylock fuzzel
```

---

## 🐚 Zsh Configuration  

### 🔗 Dependencies  
```sh
zsh atuin lsd bat starship fzf
```

#### 📦 Install  
```sh
stow zsh
```

---

## 📜 Notes  

- Ensure all dependencies are installed before running `stow`.  
- These configurations are optimized for a Wayland environment.  
- Feel free to modify and adapt these dotfiles for your setup!  


