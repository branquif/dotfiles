#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. scripts/functions.sh


info "Prompting for sudo password..."
if sudo -v; then
    # Keep-alive: update existing `sudo` time stamp until `setup.sh` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    success "Sudo credentials updated."
else
    error "Failed to obtain sudo credentials."
fi

info "Installing XCode command line tools..."
if xcode-select --print-path &>/dev/null; then
    success "XCode command line tools already installed."
elif xcode-select --install &>/dev/null; then
    success "Finished installing XCode command line tools."
else
    error "Failed to install XCode command line tools."
fi

info "Installing Homebrew"
if brew --version &>/dev/null; then
    success "Homebrew already installed"
elif /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; then
    success "Finished installing Homebrew"
else   
    error "Failed to install Homebrew"
fi

# Package control must be executed first in order for the rest to work
./packages/setup.sh
# install bin
./bin/setup.sh
#install git
./git/setup.sh
#install python
./python/setup.sh
#install karabiner
#./karabiner/setup.sh
#install hammerspoon
#./hammerspoon/setup.sh
#install neovim
./neovim/setup.sh
#install fish
./fish/setup.sh
#install repos
#./repos/setup.sh


success "Finished installing Dotfiles"