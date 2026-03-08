#!/bin/bash
set -e

# shellcheck disable=SC2154
DOTFILES_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
STOW_DIR="$DOTFILES_DIR/pkgs"
STOW_PROFILE_DIR="$SCRIPT_DIR/stow"
STOW_WM_PROFILE="${STOW_WM_PROFILE:-wm-niri.txt}"

backup_shell_configs_and_bin() {
  echo "🧩 Backing up shell configs and local bin..."
  mv "$HOME/.bashrc" "$HOME/.bashrc.bak" 2>/dev/null || true
  mv "$HOME/.zshrc" "$HOME/.zshrc.bak" 2>/dev/null || true
  mv "$HOME/.zsh" "$HOME/.zsh.bak" 2>/dev/null || true
  mv "$HOME/.local/bin" "$HOME/.local/bin.bak" 2>/dev/null || true
}

backup_config_dir_if_exists() {
  local pkg="$1"
  local src_dir="$HOME/.config/$pkg"
  local backup_dir="$HOME/.config/back/$pkg"

  if [[ -d "$src_dir" ]]; then
    echo "📂 Backing up $pkg to $backup_dir..."
    mkdir -p "$backup_dir"
    mv "$src_dir" "$backup_dir/"
  fi
}

stow_group_from_profile() {
  local group="$1"
  local profile_file="$2"

  if [[ ! -d "$STOW_DIR/$group" ]]; then
    echo "⚠️  Missing stow group directory: $STOW_DIR/$group"
    return 0
  fi

  if [[ ! -f "$profile_file" ]]; then
    echo "⚠️  Missing stow profile file: $profile_file"
    return 0
  fi

  local packages=()
  parse_list "$profile_file" packages

  for pkg in "${packages[@]}"; do
    backup_config_dir_if_exists "$pkg"

    if [[ -d "$STOW_DIR/$group/$pkg" ]]; then
      echo "🔗 Stowing $group/$pkg..."
      stow --restow --target="$HOME" --dir="$STOW_DIR/$group" "$pkg"
    else
      echo "⚠️  Package $group/$pkg not found; skipping"
    fi
  done
}

create_config_symlinks() {
  mkdir -p "$HOME/.config/back"

  echo "📦 Backing up and stowing configs by profile..."

  backup_shell_configs_and_bin

  stow_group_from_profile "core" "$STOW_PROFILE_DIR/core.txt"
  stow_group_from_profile "wayland" "$STOW_PROFILE_DIR/wayland.txt"

  if [[ -f "$STOW_PROFILE_DIR/wm.txt" ]]; then
    stow_group_from_profile "wm" "$STOW_PROFILE_DIR/wm.txt"
  elif [[ -f "$STOW_PROFILE_DIR/$STOW_WM_PROFILE" ]]; then
    # Default window manager profile for automated setup.
    stow_group_from_profile "wm" "$STOW_PROFILE_DIR/$STOW_WM_PROFILE"
  else
    echo "⚠️  No WM profile found (expected wm.txt or $STOW_WM_PROFILE)"
  fi

  stow_group_from_profile "apps" "$STOW_PROFILE_DIR/apps.txt"
}
