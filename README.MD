dotfiles for macOS development
==============================

Objective
---------

This is a dotfile configuration for macOS developers, focused on open-source software, especially python.

It will install and configure a set of defaults and tools so the developer doesn't need to.

I try to honor the XDG specification, setting all configs and environemt variables to follow the approach below:

| config item | path |
| --- | --- |
| $HOME/.config/[package] | XDG_CONFIG_HOME. Where user-specific configurations should be written (analogous to /etc).  Examples: git config and global intores are at ~/config/git instead of being set as hidden files in the home directory. |
| $HOME/.local/bin | set all simlinks and user binaries. |
| $HOME/.cache/[package] | XDG_CACHE_HOME. Where user-specific non-essential (cached) data should be written (analogous to /var/cache). |
| $HOME/.local/share/[package] | XDG_DATA_HOME. Where user-specific data files should be written (analogous to /usr/share).|

Note that I use three interesting macos apps:
- **karabiner**: Used to change the keybord behavior. I like to set caps-lock to esc, and esc to F18 to be used with hammerspoon.
- **hammerspoon**: Super interesting app to automate macos, using lua scripting. 
- **Unclutter**: macos utility to help organize my desktop.

The structure is as follows:

| config Item | description |
| --- | --- |
| bootstrap.sh | script that starts it all. Basically it installs xcode command line tools and homebrew, and then calls the package install |
| scripts | Set of utility scripts used by other scripts. |
| packages | all packages that need to be installed |
| bin | creates the user bin. all other scripts in this directory will be symlinked to the user bin directory, and then set to path. |
| fish | Shell that I use, and here is it's configuration. There is an update.fish function that helps update all installed packages. |
| git | my git configuration. Needs to be changed since it has my data in it. |
| karabiner | karabiner key remapping |
| hammerspoon | lua scripts to hammerspoon |

