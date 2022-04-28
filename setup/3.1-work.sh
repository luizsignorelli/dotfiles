#!/bin/sh

cd ~/workspace/adquick
bundle lock --add-platform arm64-darwin

# for pg gem
brew install libpq
echo 'export PATH="/opt/homebrew/opt/libpq/bin:$PATH"' >> .zprofile

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

