#!/bin/sh

set -eu

brew install ag

# mise replaces asdf. Tools and settings live in config/mise/config.toml, which
# rcm links to ~/.config/mise/config.toml back in 1-dotfiles.sh.
brew install mise

# ruby-build compiles ruby from source and needs these. No RUBY_CONFIGURE_OPTS
# any more -- ruby-build locates openssl@3 on its own.
brew install libffi libyaml openssl@3 readline zlib

# Installs everything pinned in ~/.config/mise/config.toml.
mise install

# Editors and AI tooling
brew install --cask claude
brew install --cask claude-code
brew install --cask cursor
brew install --cask cursor-cli
brew install --cask chatgpt
brew install --cask codex
