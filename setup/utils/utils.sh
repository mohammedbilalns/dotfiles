#!/bin/bash

is_installed(){
  pacman -Qi $1 &> /dev/null
}

is_dir_exists(){
  [[ -d $1 ]]
}

parse_list() {
  local file="$1"
  local -n _result="$2"  

  if [[ ! -f "$file" ]]; then
    echo "❌ File not found: $file"
    return 1
  fi

  # Read non-empty, non-comment lines into array
  mapfile -t _result < <(grep -vE '^\s*#|^\s*$' "$file")
}

check_and_install() {
  local pkg="$1"
  local helper=$AUR_HELPER

  if [[ -z "$pkg" ]]; then
    echo "⚠️  No package name provided to check_and_install()"
    return 1
  fi

  # Check if package is already installed
  if pacman -Q "$pkg" &>/dev/null; then
    echo "✅ $pkg is already installed"
  else
    echo "📦 Installing $pkg using $helper..."
    "$helper" -S --needed --noconfirm "$pkg"
  fi
}

check_and_install_from_list() {
  local -n pkg_list="$1"  
  for pkg in "${pkg_list[@]}"; do
    check_and_install "$pkg"
  done
}

check_and_enable_service(){
  local service="$1"
  if systemctl is-enabled "$service" &>/dev/null; then
    echo "✅ $service is already enabled"
  else
    systemctl enable --now "$service"
  fi
}

check_and_enable_service_from_list() {
  local -n service_list="$1"
  for service in "${service_list[@]}"; do
    check_and_enable_service "$service"
  done 
}
