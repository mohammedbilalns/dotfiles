#!/bin/bash

add_chaotic_aur() {
  if grep -q "\[chaotic-aur\]" /etc/pacman.conf; then
    echo "✅ Chaotic AUR already configured."
    return 0
  fi

  echo "🌀 Setting up Chaotic AUR..."
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
  sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' --noconfirm
  sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm
  echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
  sudo pacman -Syu --noconfirm
}

