#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -sv ${BASEDIR}/vimrc ~/.vimrc

# zsh
ln -sv ${BASEDIR}/zshrc ~/.zshrc

# git
ln -sv ${BASEDIR}/gitconfig ~/.gitconfig

if [ $(uname) == "Darwin"  ]; then
    # run the osx script
    echo "running osx setup script"
    ./osx.sh
fi
