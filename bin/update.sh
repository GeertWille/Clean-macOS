#!/bin/bash

# DATE: 2019-12-31
# VERSION: 1.9.0

###############################################################################
# Set variables                                                               #
###############################################################################

CONFIG=~/cleanMacOS/config
SETUP=~/cleanMacOS

###############################################################################
# Launch script                                                               #
###############################################################################

# Entering as Root
printf "Enter root password...\n"
sudo -v

# Keep alive Root
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Update config files                                                         #
###############################################################################

printf "⚙️ Update Zsh settings...\n"
sudo rm -rf ~/.zshrc > /dev/null 2>&1
curl https://raw.githubusercontent.com/MarioCatuogno/Clean-macOS/master/config/.zshrc -o ~/.zshrc

printf "⚙️ Update Visual Studio Code settings...\n"
sudo rm -rf ~/Library/Application\ Support/Code/User/settings.json > /dev/null 2>&1
curl https://raw.githubusercontent.com/MarioCatuogno/Clean-macOS/master/config/settings.json -o ~/Library/Application\ Support/Code/User/settings.json

printf "⚙️ Update Git settings...\n"
sudo rm -rf ~/.gitignore > /dev/null 2>&1
curl https://raw.githubusercontent.com/MarioCatuogno/Clean-macOS/master/config/.gitignore -o ~/.gitignore

###############################################################################
# Update apps                                                                 #
###############################################################################

printf "🥡 Update macOS...\n"
brew doctor && brew update && brew cleanup && brew upgrade && brew cask upgrade && mas upgrade
