#!/bin/zsh

pushd "$(dirname $0)" > /dev/null
for d in */; do
    stow -R ${d:s/\///} 2> >(grep -v "BUG in find_stowed_path" 1>&2)
done
popd >/dev/null
