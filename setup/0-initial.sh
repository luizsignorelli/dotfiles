#!/bin/sh

set -eu

# Xcode Command Line Tools. The Homebrew installer triggers this itself, but
# doing it first keeps the GUI prompt out of the middle of the brew install.
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install
  echo "Finish the Command Line Tools install, then re-run this script."
  exit 1
fi

# Homebrew. Checks the binary rather than `command -v brew`, which would fail
# on a fresh shell even when brew is already installed.
# The installer is interactive: it explains itself, waits, and asks for sudo.
if [ ! -x /opt/homebrew/bin/brew ] && [ ! -x /usr/local/bin/brew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Put brew on PATH for the rest of this script only. Deliberately not appended
# to ~/.zprofile: thoughtbot's dotfiles ship a zprofile that already evals brew
# shellenv, and 1-dotfiles.sh symlinks it over ~/.zprofile. Writing a plain
# ~/.zprofile here would just give rcup a conflict to refuse.
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

brew install git

echo "Next steps:"
echo "  - Configure your ssh key"
echo "  - Run setup/1-dotfiles.sh"

#copy the ssh key from dropbox folder
# mkdir -p ~/.ssh; chmod 700 ~/.ssh
# cp ~/Dropbox/ssh/id_rsa* ~/.ssh
# chown user:user ~/.ssh/id_rsa*
# chmod 600 ~/.ssh/id_rsa
# chmod 644 ~/.ssh/id_rsa.pub
