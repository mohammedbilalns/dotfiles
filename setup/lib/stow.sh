#!/bin/bash
set -e

CONFIGURABLE_PKGS="$SCRIPT_DIR/pkgs/configurable.txt"

backup_shell_configs_and_bin() {
  echo "🧩 Backing up shell configs and local bin..."
  mv "$HOME/.bashrc" "$HOME/.bashrc.bak" 2>/dev/null || true
  mv "$HOME/.zshrc" "$HOME/.zshrc.bak" 2>/dev/null || true
  mv "$HOME/.zsh" "$HOME/.zsh.bak" 2>/dev/null || true
  mv "$HOME/.local/bin" "$HOME/.local/bin.bak" 2>/dev/null || true
}

create_config_symlinks() {
  mkdir -p "$HOME/.config/back"

  echo "📦 Backing up and stowing configs..."
  parse_list "$CONFIGURABLE_PKGS" pkgs

  # Backup shell configs
  backup_shell_configs_and_bin

  for pkg in "${pkgs[@]}"; do
    local src_dir="$HOME/.config/$pkg"
    local backup_dir="$HOME/.config/back/$pkg"

    # Backup existing config if exists
    if [[ -d "$src_dir" ]]; then
      echo "📂 Backing up $pkg to $backup_dir..."
      mkdir -p "$backup_dir"
      mv "$src_dir" "$backup_dir/"
    fi

    # Stow new config
    echo "🔗 Stowing $pkg..."
    stow --restow --target="$HOME" --dir="$SCRIPT_DIR" "$pkg"
  done
}

