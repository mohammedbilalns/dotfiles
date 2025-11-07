#!/bin/bash

configure_pacman() {
  local conf="/etc/pacman.conf"

  echo "🔧 Configuring pacman..."

  # Ensure ParallelDownloads = 7 
  if grep -qE "^[#]*\s*ParallelDownloads" "$conf"; then
    sudo sed -i 's/^[#]*\s*ParallelDownloads.*/ParallelDownloads = 7/' "$conf"
  else
    echo "ParallelDownloads = 7" | sudo tee -a "$conf" > /dev/null
  fi

  if grep -qE "^[#]*\s*Color" "$conf"; then
    sudo sed -i 's/^[#]*\s*Color/Color/' "$conf"
  else
    echo "Color" | sudo tee -a "$conf" > /dev/null
  fi

  if grep -qE "^[#]*\s*ILoveCandy" "$conf"; then
    sudo sed -i 's/^[#]*\s*ILoveCandy/ILoveCandy/' "$conf"
  else
    echo "ILoveCandy" | sudo tee -a "$conf" > /dev/null
  fi

  echo "✅ Pacman configured"
}

