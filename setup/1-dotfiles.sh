#!/bin/sh

set -eu

# Guarded on .git rather than the directory, so a re-run is a no-op but a
# half-created ~/dotfiles fails loudly on the clone instead of being skipped.
if [ ! -d ~/dotfiles/.git ]; then
  git clone git@github.com:thoughtbot/dotfiles.git ~/dotfiles
fi

if [ ! -d ~/dotfiles-local/.git ]; then
  git clone git@github.com:luizsignorelli/dotfiles.git ~/dotfiles-local
fi

brew install zsh-autosuggestions
brew install rcm

# Must come before rcup. thoughtbot's post-up hook runs vim +PlugUpdate, and
# their vimrc.bundles only uses brew's fzf if /opt/homebrew/opt/fzf already
# exists -- otherwise it clones junegunn/fzf to ~/.fzf with `do: ./install
# --all`, and that installer appends to ~/.zshrc, which is a symlink into the
# thoughtbot clone.
brew install fzf

# thoughtbot's README says to use $HOME/dotfiles/rcrc here. Ours is the same
# plus an exclude for setup/, which otherwise gets linked into ~/.setup.
# Only matters on this first run -- rcup links ours to ~/.rcrc for later ones.
env RCRC=$HOME/dotfiles-local/rcrc rcup
