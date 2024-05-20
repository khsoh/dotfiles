#!/usr/bin/env bash

SCRIPTNAME=$(readlink -f ${BASH_SOURCE[0]})
pushd "$(dirname $SCRIPTNAME)" > /dev/null

if ! nix --version >/dev/null 2>&1; then
    echo Nix is not installed
    echo "Execute: sh <(curl -L https://raw.githubusercontent.com/khsoh/mymacnix/main/nix-autoinstall) to install Nix"
    exit 1
fi

git pull --recurse-submodules origin main
git submodule update --checkout --remote --recursive

# Setup the default user email to use for comment in git operations
./setup-gitemail.sh

# Setup the remote URLs for fetching and pushing from and to remote URL
./git-remote-init.sh

## Will update/install Homebrew if not present
(brew update >/dev/null 2>&1) || (/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")

# Installs packages
brew bundle --file HOME-Darwin/.Brewfile

# Run brew diagnostics
brew doctor 2>&1

# Upgrade the packages
brew upgrade

# Sets up the symlinks with stow
. ./dostow.sh

# Start logrotate service
brew services restart logrotate

popd >/dev/null
