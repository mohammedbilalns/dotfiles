#!/bin/bash

set -e 

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/lib/aur-helper.sh"
source "$SCRIPT_DIR/utils/utils.sh"
source "$SCRIPT_DIR/lib/chaotic-aur.sh"
source "$SCRIPT_DIR/lib/pacman.sh"
source "$SCRIPT_DIR/lib/stow.sh"

REPO_URL=https://github.com/mohammedbilalns/dotfiles.git
LOCAL_REPO=$HOME/dotfiles
PKG_DIR="$SCRIPT_DIR/pkgs"
PKGS=("$PKG_DIR"/*.txt)
SRVC_DIR="$SCRIPT_DIR/services"
SRVCS=("$SRVC_DIR"/*.txt)

# move to home 
cd "$HOME"

# setup aur helper
if ! is_installed "$AUR_HELPER" ; then
  install_aur_helper
else
  echo "✅ $AUR_HELPER is already installed"
fi

# setup chaotic aur && update pacman.conf 

add_chaotic_aur
configure_pacman

# ensure git is installed
check_and_install git

# CLONE THE REPO 
if ! is_dir_exists "$LOCAL_REPO" ; then
  git clone "$REPO_URL"
else
  echo "✅ $LOCAL_REPO exists"
fi


# install packages 
# FIX: Some Packages fails to install 
for list in "${PKGS[@]}"; do
  local_pkgs=() 
  parse_list "$list" local_pkgs
  check_and_install_from_list local_pkgs
done

# backup and symlink the existing configs
# FIX: stow: ERROR: The stow directory dotfiles/setup does not contain package atuin
create_config_symlinks

# configure shell 
chsh -s "$(which zsh)"

# configure tlp and thermald and other services 
for list in "${SRVCS[@]}"; do
  local_services=()
  parse_list "$list" local_services
  check_and_enable_service_from_list local_services
done 

