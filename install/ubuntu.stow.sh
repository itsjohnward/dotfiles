apt install stow -y

cd $HOME/dotfiles/configs
stow stow --target=$HOME
