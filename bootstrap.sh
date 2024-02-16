#!/usr/bin/env bash

pushd "$(dirname $0)" > /dev/null

git pull origin main

## Will install Homebrew if not present
(brew --version >/dev/null 2>&1) || (/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")

# Installs packages
brew bundle

# Sets up the symlinks with stow
for d in */; do
    stow -Rt ~ ${d/\//} 2> >(grep -v "BUG in find_stowed_path" 1>&2)
done

popd >/dev/null
