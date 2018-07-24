# XDG - set defaults as they may not be set (eg Ubuntu 14.04 LTS)
# See https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
# and https://wiki.archlinux.org/index.php/XDG_Base_Directory_support
set -x -g XDG_CONFIG_HOME "$HOME/.config"
set -x -g XDG_DATA_HOME "$HOME/.local/share"
set -x -g XDG_CACHE_HOME "$HOME/.cache"
set -x -g XDG_EXEC_HOME "$HOME/.local/bin"
set -x -g XDG_RUNTIME_DIR /tmp

# User bin folder
set -x -g PATH $XDG_EXEC_HOME $PATH 

# set ls colors
#set -x -g LS_COLORS "di=38;5;27:fi=38;5;7:ln=38;5;51:pi=40;38;5;11:so=38;5;13:or=38;5;197:mi=38;5;161:ex=38;5;9:"

# set terminal colors
set -x -g TERM "xterm-256color"

# set default editor
set -x -g EDITOR /usr/local/bin/nvim

# set language to use
set -x -g LC_ALL en_US.UTF-8
set -x -g LANG en_US.UTF-8

# Pipenv completions
eval (pipenv --completion)

# set pyenv
# pyenv
status --is-interactive; and source (pyenv init - | psub)
set -x -g PYENV_ROOT eval pyenv root

# npm to use XDG
# see npm config ls -l | grep /
set -x -g NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/config
set -x -g NPM_CONFIG_CACHE $XDG_CACHE_HOME/npm
set -x -g NPM_CONFIG_TMP $XDG_RUNTIME_DIR/npm


