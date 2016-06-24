#!/bin/bash

echo "Running Sublime setup script"

# Install Sublime Text 3
brew tap caskroom/versions
brew install brew-cask
brew cask install sublime-text3

# Install Package Control
mkdir -p ~/"Library/Application Support/Sublime Text 3/Installed Packages"
curl -o ~/"Library/Application Support/Sublime Text 3/Installed Packages/Package Control.sublime-package" "https://packagecontrol.io/Package%20Control.sublime-package"

# Define destination and current directory
SUBLIME_USER_DIR=~/"Library/Application Support/Sublime Text 3/Packages/User"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create sublime user dir if it doesn't already exist
mkdir -p "$SUBLIME_USER_DIR"

# Link standard user settings
ln -sv "${BASEDIR}/sublime/Preferences.sublime-settings" "$SUBLIME_USER_DIR/Preferences.sublime-settings"

# Link the package control settings
ln -sv "${BASEDIR}/sublime/Package Control.sublime-settings" "$SUBLIME_USER_DIR/Package Control.sublime-settings"
