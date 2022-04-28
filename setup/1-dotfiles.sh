#!/bin/sh

git clone git@github.com:thoughtbot/dotfiles.git ~/dotfiles
git clone git@github.com:luizsignorelli/dotfiles.git ~/dotfiles-local

brew install starship
brew install zsh-autosuggestions
brew install rcm

env RCRC=$HOME/dotfiles/rcrc rcup

