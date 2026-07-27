#!/bin/sh

git clone git@github.com:thoughtbot/dotfiles.git ~/dotfiles
git clone git@github.com:luizsignorelli/dotfiles.git ~/dotfiles-local

brew install starship
brew install zsh-autosuggestions
brew install rcm

# thoughtbot's README says to use $HOME/dotfiles/rcrc here. Ours is the same
# plus an exclude for setup/, which otherwise gets linked into ~/.setup.
# Only matters on this first run -- rcup links ours to ~/.rcrc for later ones.
env RCRC=$HOME/dotfiles-local/rcrc rcup

