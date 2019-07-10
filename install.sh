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
brew install clang-format cmake fish fzf htop git mercurial ninja reattach-to-user-namepace ripgrep the_silver_searcher tmux vim wget

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Link config files
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/zshrc ~/.zshrc
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf
ln -s ${BASEDIR}/hgrc ~/.hgrc
ln -s ${BASEDIR}/gitconfig ~/.gitconfig
ln -s ${BASEDIR}/config.fish ~/.config/fish/config.fish

# Link this folder to .dotfiles so can be referenced elsewhere
ln -s ${BASEDIR} ~/.dotfiles

# Install vim plugins
vim +PluginInstall +qall

