#!/usr/bin/env bash

declare -r SCRIPT_NAME=$(readlink -f ${BASH_SOURCE[0]})
bootfile=$(dirname $SCRIPT_NAME)/bootstrap-$(uname).sh
if [[ -e $bootfile ]]; then
    BRANCH=${BRANCH:-main} source $bootfile
else
    echo "WARNING: bootstrap support not available for $(uname)"
fi
