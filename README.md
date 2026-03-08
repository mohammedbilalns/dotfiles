# Dotfiles

Personal Linux dotfiles managed with GNU Stow.

## Repository Layout

```text
dotfiles/
  pkgs/
    core/      # shell/editor/terminal/binaries
    wayland/   # shared wayland components
    wm/        # compositor/window-manager configs
    apps/      # optional app configs
  setup/       # installation and bootstrap scripts
  notes/
```

Each package keeps the real target path inside it (for example `.config/...`, `.local/bin/...`, `.zshrc`).

## Stow Usage

Run commands from the repository root:

```sh
cd ~/dotfiles
```

### 1) Core packages

```sh
stow --dir pkgs/core --target "$HOME" bash bin helix kitty nano nushell nvim tmux zsh
```

### 2) Shared wayland packages

```sh
stow --dir pkgs/wayland --target "$HOME" anyrun foot fuzzel mako swayidle swaylock waybar
```

### 3) Select one WM/compositor profile

```sh
# Niri
stow --dir pkgs/wm --target "$HOME" niri

# Sway
stow --dir pkgs/wm --target "$HOME" sway

# Hyprland
stow --dir pkgs/wm --target "$HOME" hypr
```

### 4) Optional app packages

```sh
stow --dir pkgs/apps --target "$HOME" atuin evremap fastfetch htop lsd mango mpv neofetch tomat wallpapers yazi zed zellij
```

## Restow / Unstow

```sh
# Re-apply an existing package
stow --restow --dir pkgs/core --target "$HOME" zsh

# Remove links for a package
stow --delete --dir pkgs/core --target "$HOME" zsh
```

