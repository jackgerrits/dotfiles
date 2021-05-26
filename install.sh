#!/bin/bash

# --------
# Symlinks
# --------

./install-symlinks.sh

# ------------------------
# OS specific installation
# ------------------------

if [ $(uname) == "Darwin"  ]; then
    ./macos.sh
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    ./ubuntu.sh
fi

# ------------------------
# OS agnostic installation
# ------------------------

# Install nix
curl -L https://nixos.org/nix/install | sh

# Oof this is slow...
nix-env -i any-nix-shell -f https://github.com/NixOS/nixpkgs/archive/master.tar.gz

# Install fisher
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

# Install fisher plugins
fish -c "fisher update"