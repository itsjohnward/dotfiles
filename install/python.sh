cd $HOME
dots=$HOME/dotfiles

# install pyenv prerequsites
apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev python

cd $dots/configs
stow python

source $HOME/.bashrc

pyenv install 2.7.15
pyenv install 3.7.0
