#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$XDG_CONFIG_HOME/git"


substep_info "Creating user git folder..."
mkdir -p "$DESTINATION"

info "Configuraing git..."

symlink "$SOURCE/config" "$DESTINATION/config"
symlink "$SOURCE/ignore" "$DESTINATION/ignore"

success "Finished configuring git."
