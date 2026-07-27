#!/bin/sh

cd ~/workspace/adquick
bundle lock --add-platform arm64-darwin

# for pg gem. The PATH entry lives in zshrc.local -- ~/.zprofile is a symlink
# into the thoughtbot clone, so appending to it would dirty that repo.
brew install libpq

# pgcli > better psql
brew install pgcli

# for h3_ruby gem
brew install cmake

# pdf2image deps
brew install poppler
brew install imagemagick

#heroku cli
brew tap heroku/brew && brew install heroku
heroku plugins:install heroku-builds

brew install redis

brew install rubymine
brew install slack

