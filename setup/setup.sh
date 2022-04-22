#!/bin/sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install iterm2
brew cask install opera
brew cask install google-chrome
brew cask install evernote
brew cask install dropbox

brew install ag

#copy the ssh key from dropbox folder
mkdir -p ~/.ssh; chmod 700 ~/.ssh
cp ~/Dropbox/ssh/id_rsa* ~/.ssh
chown user:user ~/.ssh/id_rsa*
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub

brew install git

#zsh
brew install zsh zsh-completions
sudo echo "$(which zsh)" >> /etc/shells
chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# adsf

#ruby
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.0
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

#node
brew install coreutils gpg
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

