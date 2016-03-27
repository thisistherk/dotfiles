#!/usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Generate ssh key if doesn't exist
[[ -f ~/.ssh/id_rsa ]] || ssh-keygen -t rsa -b 2048

# Install homebrew
if test ! $(which brew); then
    curl -L https://raw.githubusercontent.com/Homebrew/install/master/install | ruby
fi

# Update homebrew
brew update

# Install various stuff via brew
brew install cmake cmus htop git mercurial ninja the_silver_searcher tmux vim wget zsh zsh-completions

# Install oh-my-zsh
[[ -d ~/.oh-my-zsh ]] || curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Link config files
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/zshrc ~/.zshrc
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf
ln -s ${BASEDIR}/hgrc ~/.hgrc

# Link this folder to .dotfiles so can be referenced elsewhere
ln -s ${BASEDIR} ~/.dotfiles

# Install cask
brew tap caskroom/cask

# Install apps
brew cask install --appdir="/Applications" google-chrome dropbox 1password iterm2 suspicious-package

