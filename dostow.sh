#!/usr/bin/env bash

pushd "$(dirname $0)" > /dev/null

# Sets up the symlinks with stow
stow -Rt / ROOT 2> >(grep -v "BUG in find_stowed_path" 1>&2)
stow -Rt ~ HOME 2> >(grep -v "BUG in find_stowed_path" 1>&2)

popd >/dev/null
