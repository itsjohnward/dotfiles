#!/bin/bash

echo 'Executing ubuntu.sh...'

apt update -y
apt upgrade -y
apt autoremove -y

dots=$HOME/dotfiles

git clone --recurse-submodules https://github.com/itsjohnward/dotfiles.git $dots
cd $dots

cd $dots/install
./stow.sh

cd $dots/configs
stow bash

cd $dots/install
./python.sh

cd $dots/configs
stow python

cd $dots/install
./node.sh

cd $dots/configs
stow node

source $HOME/.bashrc
