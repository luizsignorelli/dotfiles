#!/bin/sh

brew install ag

# adsf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
brew install gpg gawk

#ruby
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
brew install libffi libyaml zlib readline openssl@1.1
export RUBY_CONFIGURE_OPTS="--with-zlib-dir=/opt/homebrew/opt/zlib --with-openssl-dir=/opt/homebrew/opt/openssl@1.1 --with-readline-dir=/opt/homebrew/opt/readline --with-libyaml-dir=/opt/homebrew/opt/libyaml"
asdf install ruby 3.0.2

#node
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 16.14.2
npm install --global yarn