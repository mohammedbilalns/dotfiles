#!/bin/bash

AUR_HELPER=paru
AUR_HELPER_URL=https://aur.archlinux.org/paru.git

install_aur_helper() {
  git clone $AUR_HELPER_URL
  cd paru
  makepkg -si
  echo "aur helper installed"
}
