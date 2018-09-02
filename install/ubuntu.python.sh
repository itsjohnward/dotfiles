# install pyenv prerequsites
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev python

# make sure pip and virtualenv are installed
python -m pip install --user --upgrade pip
python -m pip install --user virtualenv virtualenvwrapper

echo 'export WORKON_HOME=$HOME/.virtualenvs' >> ~/.bashrc
echo 'export PROJECT_HOME=$HOME' >> ~/.bashrc

echo 'source "$HOME/.local/bin/virtualenvwrapper.sh"' >> ~/.bashrc

# install pyenv
# curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

# install pyenv plugins
git clone https://github.com/pyenv/pyenv-virtualenv.git "$HOME/.pyenv/plugins/pyenv-virtualenv"
git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git "$HOME/.pyenv/plugins/pyenv-virtualenvwrapper"
echo 'PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"' >> ~/.bashrc
echo 'pyenv virtualenvwrapper' >> ~/.bashrc
git clone git://github.com/pyenv/pyenv-update.git "$HOME/.pyenv/plugins/pyenv-update"