#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all
brew install git

# Install Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Development tool casks
# Misc casks
#brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" whatsapp
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" authy
brew cask install --appdir="/Applications" spectacle
# Remove outdated versions from the cellar.
brew cleanup
