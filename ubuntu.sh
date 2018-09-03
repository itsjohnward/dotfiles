#!/bin/bash

echo 'Executing ubuntu.sh...'

sudo apt update && sudo apt upgrade && sudo apt autoremove

git clone --recurse-submodules https://github.com/itsjohnward/dotfiles.git ~/dotfiles
cd ~/dotfiles

./install/ubuntu.python.sh
