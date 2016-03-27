# Path to your oh-my-zsh installation.
export ZSH=/Users/rich/.oh-my-zsh

# Set name of the theme to load.
# ZSH_THEME="rich"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Plugins to install
plugins=(brew git history mercurial tmux vi-mode web-search z zsh-syntax-highlighting)

# Set path
export PATH="~/.dotfiles/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Set up oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Link to brew zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Preferred editor for local and remote sessions
export EDITOR='vim'

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Simple prompt
export PROMPT='%{$fg[white]%}%* %{$fg[cyan]%}%1~ %{$fg[blue]%}➜  %{$reset_color%}'

