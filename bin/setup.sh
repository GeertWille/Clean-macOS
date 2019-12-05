#!/bin/bash

# DATE: 2019-12-31
# VERSION: 1.9.0

###############################################################################
# Launch script                                                               #
###############################################################################

# Entering as Root
printf "Enter root password...\n"
sudo -v

# Keep alive Root
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Install dependencies                                                        #
###############################################################################

# Install XCode Command Line Tools
printf "🥡 Installing XCode CL tools...\n"
xcode-select --install

# Install Brew
printf "🥡 Check Brew...\n"
if test ! $(which brew); then
  printf "🥡 Installing Homebrew...\n"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  printf "🥡 Homebrew is already installed...\n"
  exit
fi

# Check Brews
brew doctor && brew update && brew upgrade

# Tap Repositories
printf "🥡 Installing Brew Cask and MAS...\n"
brew install mas
brew tap homebrew/cask-fonts

exit
