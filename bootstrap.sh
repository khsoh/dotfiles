#!/usr/bin/env bash

pushd "$(dirname $0)" > /dev/null;

git pull origin main;

for d in */; do
    stow -Rt ~ ${d/\//} 2> >(grep -v "BUG in find_stowed_path" 1>&2)
done

popd >/dev/null;
