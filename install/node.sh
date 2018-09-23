cd $HOME
dots=$HOME/dotfiles

# install pyenv prerequsites
apt-get install -y build-essential libssl-dev

cd $dots/configs
stow node

source $HOME/.bashrc

nvm install node
nvm alias default node
