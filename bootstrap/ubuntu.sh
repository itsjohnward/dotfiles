#!/bin/bash

echo 'Executing ubuntu.sh...'

apt update -y
apt upgrade -y
apt autoremove -y

dots=$HOME/dotfiles

git clone --recurse-submodules https://github.com/itsjohnward/dotfiles.git $dots
cd $dots

chmod 700 $dots/install/ubuntu.stow.sh
./$dots/install/ubuntu.stow.sh
cd $dots/configs
stow stow

stow bash

chmod 700 $dots/install/ubuntu.python.sh
./$dots/install/ubuntu.python.sh
