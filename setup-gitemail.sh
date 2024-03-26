#!/usr/bin/env bash

GFILE=~/.gitconfig-email
if [ -f $GFILE ]; then
    echo $GFILE already exist - will not overwrite file
    exit
fi
read -p "Default email to use for git: " email
echo "[user]" > $GFILE
echo -e "\temail = $email" >> $GFILE

