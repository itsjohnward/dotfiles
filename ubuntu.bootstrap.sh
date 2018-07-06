#!/bin/bash

printenv

printenv APPVEYOR_BUILD_FOLDER

sudo $(APPVEYOR_BUILD_FOLDER)/scripts/install-python.sh

git clone https://github.com/itsjohnward/dotfiles.git
cd dotfiles

# activate the project's virtual environment and install dependencies
pyenv install --skip-existing
mkvirtualenv -r requirements.txt py-env

ansible-playbook playbooks/main.yml --connection=local -t linux,ubuntu