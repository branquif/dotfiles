# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
function update
    echo "softwareupdate updating"
    sudo softwareupdate -i -a
    echo "brew updating"
    brew update
    brew upgrade
    brew cleanup
    echo "npm updating"
    npm install npm -g
    npm update -g
    echo "gems updating"
    sudo gem update --system
    sudo gem update
    echo "default python env updating"
    pyenv activate default
    pip-review --auto
end
