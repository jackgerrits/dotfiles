#!/bin/bash

echo "Running osx setup script"

# brew
which brew > /dev/null
if [ $? == 1  ]; then
    # install brew
    echo "installing brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install fish and set as default shell
brew install fish
chsh -s $(which fish)

# ------------
# OSX Defaults
# ------------

# remove accent when holding down a key
defaults write -g ApplePressAndHoldEnabled -bool false

# speed up window maximize time
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# Save screenshots to custom folder (default: Desktop)
defaults write com.apple.screencapture location -string "~/Pictures/screenshots"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
