#! /usr/bin/env sh

PYTHON_VER=3.7.0
DEFAULT_VENV=default

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

#sudo -v

# installing python defaults
#info "installing pyenv"
#if pyenv --version &>/dev/null; then
#    success "pyenv already installed"
#elif curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash; then
#    success "pyenv installed"
#else
#    error "pyenv could not be installed"
#fi

pyenv rehash

# start pyenv 
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# install virtualenv at python2
info "installing python2 virtualenv"
python2 -m pip install --upgrade pip
python2 -m pip install virtualenv

info "installing python interpreter"
pyenv install $PYTHON_VER

pyenv global $PYTHON_VER

info "generating the default python environment"
pyenv virtualenv $PYTHON_VER $DEFAULT_VENV

pyenv activate $DEFAULT_VENV

python -m pip install --upgrade pip
pip install -r requirements.txt

pyenv global $PYTHON_VER $DEFAULT_VENV

