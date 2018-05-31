#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
# >>> Added by cnchi installer
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/nano

alias install='makepkg -sirc'
source <(kubectl completion bash)

export TERM=xterm-256color

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
