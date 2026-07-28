#!/bin/sh

set -eu

# Clone if missing, otherwise fast-forward. Guarded on .git rather than the
# directory so a half-created clone fails loudly instead of being skipped.
#
# A dirty clone is left alone rather than pulled: tools that write through the
# ~/.zshrc symlink can leave stray edits in the thoughtbot clone (fzf's
# installer used to), and a failed merge mid-setup is a bad way to find out.
sync_repo() {
  url=$1
  dir=$2

  if [ ! -d "$dir/.git" ]; then
    git clone "$url" "$dir"
  elif [ -n "$(git -C "$dir" status --porcelain)" ]; then
    echo "$dir has local changes -- skipping pull"
  else
    git -C "$dir" pull --ff-only
  fi
}

sync_repo git@github.com:thoughtbot/dotfiles.git ~/dotfiles
sync_repo git@github.com:luizsignorelli/dotfiles.git ~/dotfiles-local

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
