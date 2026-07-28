#!/bin/sh

# No set -eu here on purpose: a single cask that needs a license prompt or is
# temporarily broken upstream shouldn't stop the rest of the list installing.

# Browsers
brew install --cask arc
brew install --cask firefox
brew install --cask google-chrome

# Terminal and window management
brew install --cask ghostty
brew install --cask itsycal
brew install --cask rectangle

# Editors and AI tooling
brew install --cask chatgpt
brew install --cask claude
brew install --cask claude-code
brew install --cask codex
brew install --cask cursor
brew install --cask cursor-cli

# Communication
brew install --cask whatsapp
brew install --cask zoom

# Everything else
brew install --cask dropbox
brew install --cask github
brew install --cask microsoft-office
