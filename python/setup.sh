#! /usr/bin/env sh

PYTHON_VER=3.7.0
DEFAULT_VENV=default

. ../scripts/functions.sh

sudo -v

# installing python defaults
info "installing pyenv"
if pyenv --version &>/dev/null; then
    success "pyenv already installed"
elif curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash; then
    success "pyenv installed"
else
    error "pyenv could not be installed"
fi

# start pyenv 
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

info "installing python interpreter"
pyenv install $PYTHON_VER
pyenv global $PYTHON_VER

info "generating the default python environment"
pyenv virtualenv $PYTHON_VER $DEFAULT_VENV

pyenv activate $DEFAULT_VENV

pip install -r requirements.txt

pyenv global $PYTHON_VER $DEFAULT_VENV
