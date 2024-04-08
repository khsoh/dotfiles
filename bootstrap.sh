#!/usr/bin/env bash

bootfile=$(dirname $0)/bootstrap-$(uname).sh
if [[ -e $bootfile ]]; then
    source $bootfile
else
    echo "WARNING: bootstrap support not available for $(uname)"
fi
