# install pyenv prerequsites
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev python

# make sure pip and virtualenv are installed
python -m pip install --user --upgrade pip
python -m pip install --user virtualenv

# install pyenv
# curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

source ~/.bashrc

# install pyenv plugins
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git $(pyenv root)/plugins/pyenv-virtualenvwrapper
echo 'PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"' >> ~/.bashrc
echo 'pyenv virtualenvwrapper_lazy' >> ~/.bashrc
git clone git://github.com/pyenv/pyenv-update.git ~/.pyenv/plugins/pyenv-update

source ~/.bashrc

pyenv update

git clone https://github.com/itsjohnward/dotfiles.git
cd dotfiles

# activate the project's virtual environment and install dependencies
pyenv install --skip-existing
mkvirtualenv -r requirements.txt py-env

ansible-playbook playbooks/main.yml --connection=local -t linux,ubuntu