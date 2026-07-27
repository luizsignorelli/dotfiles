#!/bin/sh

git clone git@github.com:thoughtbot/dotfiles.git ~/dotfiles
git clone git@github.com:luizsignorelli/dotfiles.git ~/dotfiles-local

brew install starship
brew install zsh-autosuggestions
brew install rcm

# Use our own rcrc, not thoughtbot's -- theirs doesn't exclude setup/,
# which would get symlinked as ~/.setup on this first run.
env RCRC=$HOME/dotfiles-local/rcrc rcup

