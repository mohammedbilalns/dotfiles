# Dotfiles

Personal Linux dotfiles managed with GNU Stow.

## Repository Layout

```text
dotfiles/
  nvim/        # Neovim config (submodule)
  zsh/         # Zsh config
  tmux/        # Tmux config
  kitty/       # Kitty config
  waybar/      # Waybar config
  hypr/        # Hyprland config
  sway/        # Sway config
  niri/        # Niri config
  ...          # other app/window-manager packages
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
stow --target "$HOME" bash bin helix kitty nano nushell nvim tmux zsh
```

### 2) Shared wayland packages

```sh
stow --target "$HOME" anyrun foot fuzzel mako swayidle swaylock waybar
```

### 3) Select one WM/compositor profile

```sh
# Niri
stow --target "$HOME" niri

# Sway
stow --target "$HOME" sway

# Hyprland
stow --target "$HOME" hypr
```

### 4) Optional app packages

```sh
stow --target "$HOME" atuin evremap fastfetch htop lsd mango mpv neofetch tomat wallpapers yazi zed zellij
```

## Restow / Unstow

```sh
# Re-apply an existing package
stow --restow --target "$HOME" zsh

# Remove links for a package
stow --delete --target "$HOME" zsh
```
