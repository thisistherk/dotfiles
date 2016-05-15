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
brew install cmake cmus htop git mercurial ninja reattach-to-user-namepace the_silver_searcher tmux vim wget zsh zsh-completions

# Install oh-my-zsh
[[ -d ~/.oh-my-zsh ]] || curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Install zsh-syntax-highlighting/completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# Remove existing .zshrc - will link to ours instead
rm ~/.zshrc

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Link config files
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/zshrc ~/.zshrc
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf
ln -s ${BASEDIR}/hgrc ~/.hgrc
ln -s ${BASEDIR}/gitconfig ~/.gitconfig

# Link this folder to .dotfiles so can be referenced elsewhere
ln -s ${BASEDIR} ~/.dotfiles

# Install vim plugins
vim +PluginInstall +qall

