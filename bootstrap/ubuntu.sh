#!/bin/bash

echo 'Executing ubuntu.sh...'

apt update -y
apt upgrade -y
apt autoremove -y

dots=$HOME/dotfiles

git clone --recurse-submodules https://github.com/itsjohnward/dotfiles.git $dots
cd $dots

cd $dots/install
chmod 700 ubuntu.stow.sh
./ubuntu.stow.sh

cd $dots/configs
stow bash

cd $dots/install
chmod 700 ubuntu.python.sh
./ubuntu.python.sh

source ~/.bashrc
