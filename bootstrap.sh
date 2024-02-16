#!/usr/bin/env bash

pushd "$(dirname $0)" > /dev/null

git pull --recurse-submodules origin main

## Will update/install Homebrew if not present
(brew update >/dev/null 2>&1) || (/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")

# Installs packages
brew bundle

# Run brew diagnostics
brew doctor || return 1

# Upgrade the packages
brew upgrade

# Sets up the symlinks with stow
for d in */; do
    stow -Rt ~ ${d/\//} 2> >(grep -v "BUG in find_stowed_path" 1>&2)
done

popd >/dev/null
