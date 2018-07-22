#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

info "Will setup the Rafael Bodill's Neo/vim Config..."
#https://github.com/rafi/vim-config

substep_info "Cloning the repo"
git clone git://github.com/rafi/vim-config.git ~/.config/nvim

substep_info "setup the neovim virtual env"
cd ~/.config/nvim
./venv.sh

substep_info "Make install"
make


find * -name "*.json" | while read fn; do
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done
clear_broken_symlinks "$DESTINATION"

success "Finished setting up Neovim."
