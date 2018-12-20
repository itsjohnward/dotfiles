# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for file in ~/.bashrc.d/*.bashrc;
do
 source "$file"
done

# TODO: Fix .profile instead of sourcing .bash_profile in .bashrc https://askubuntu.com/a/121075
. ~/.bash_profile
