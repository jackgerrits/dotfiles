#!/bin/bash

# Install fish
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install -y fish

# Set fish as default shell
sudo chsh -s /usr/bin/fish
