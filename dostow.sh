#!/usr/bin/env bash

source ~/.bash_profile

pushd "$(dirname $0)" > /dev/null

# Sets up the symlinks with stow
for d in */; do
    stow -Rt ~ ${d/\//} 2> >(grep -v "BUG in find_stowed_path" 1>&2)
done

popd >/dev/null
