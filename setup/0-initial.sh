#!/bin/sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile

source ~/.zprofile

brew install git

echo "Next steps:"
echo "  - Configure your ssh key"

#copy the ssh key from dropbox folder
# mkdir -p ~/.ssh; chmod 700 ~/.ssh
# cp ~/Dropbox/ssh/id_rsa* ~/.ssh
# chown user:user ~/.ssh/id_rsa*
# chmod 600 ~/.ssh/id_rsa
# chmod 644 ~/.ssh/id_rsa.pub
