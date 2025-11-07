#!/bin/bash

set -e 

source ./lib/aur-helper.sh
source ./utils/utils.sh
source ./lib/chaotic-aur.sh
source ./lib/pacman.sh

REPO_URL=https://github.com/mohammedbilalns/dotfiles.git
LOCAL_REPO=$HOME/dotfiles
PKGS=./pkgs/*.txt
CONFIGURABLE_PKGS=./pkgs/configurable.txt

# move to home 
cd ~

# setup aur helper
if ! is_installed $AUR_HELPER ; then
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
if ! is_dir_exists $LOCAL_REPO ; then
  git clone $REPO_URL
else
  git -C $LOCAL_REPO pull
fi


# install packages 
for list in $PKGS; do
  parse_list "$list" pkgs
  check_and_install_from_list pkgs
done


cd $LOCAL_REPO
# backup and symlink the existing configs
#TODO: create utility to backup and stow the symlinks  


# configure shell 
chsh -s ${which zsh}

# configure tlp and thermald and other services 
# TODO: create utiltity to enable the services like tlp, thermald, evremap , redis-server, rabbitmq, mongodb
