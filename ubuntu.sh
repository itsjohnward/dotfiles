#!/bin/bash

echo 'Executing ubuntu.sh...'

echo "Updating system"
apt update -y
apt upgrade -y
apt autoremove -y

dots=$HOME/dotfiles

git clone --recurse-submodules https://github.com/itsjohnward/dotfiles.git $dots
cd $dots

echo "Installing Stow"
cd $dots/install
./stow.sh
cd $dots/configs
stow bash

echo "Package managers"
echo "================"
echo "Linuxbrew"
# linuxbrew

echo "Languages"
echo "========="
echo "Python"
echo "------"
cd $dots/install
# subtree https://github.com/python/cpython/tree/master & git describe to get latest non-rc / non-alpha version
# make & test
./python.sh
cd $dots/configs
stow python
# pipenv

echo "R"
echo "-"
# r

echo "Nodejs"
echo "------"
# subtree https://github.com/nodejs/node
cd $dots/install
./node.sh
cd $dots/configs
stow node

echo "Ruby"
echo "----"
# ruby

echo "Haskell"
echo "-------"
# haskell

echo "Dev tools"
echo "========="
echo "direnv"
echo "------"
# direnv

echo "zsh"
echo "---"
# fizsh

echo "vim"
echo "---"
# vim

echo "tmux"
echo "----"
# tmux

echo "vagrant"
echo "-------"
# vagrant

echo "docker"
echo "------"
# docker

source $HOME/.bashrc
