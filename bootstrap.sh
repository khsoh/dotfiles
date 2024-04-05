#!/usr/bin/env bash

pushd "$(dirname $0)" > /dev/null

git pull --recurse-submodules origin main

# Setup the default user email to use for comment in git operations
./setup-gitemail.sh

# Setup the remote URLs for fetching and pushing from and to remote URL
./git-remote-init.sh

## Will update/install Homebrew if not present
(brew update >/dev/null 2>&1) || (/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")

# Installs packages
brew bundle

# Run brew diagnostics
brew doctor 2>&1

# Upgrade the packages
brew upgrade

# Sets up the symlinks with stow
. ./dostow.sh

# Start logrotate service
brew services restart logrotate

popd >/dev/null
