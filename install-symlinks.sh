#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --------
# Symlinks
# --------

rm -r ~/.config

ln -sfv ${BASEDIR}/config ~/.config

if grep -q Microsoft /proc/version; then
    echo "[credential]" | sudo tee -a $HOME/.config/git/config >/dev/null
    echo "	helper = /mnt/c/Program\\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe" | sudo tee -a $HOME/.config/git/config >/dev/null
fi
