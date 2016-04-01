set nocompatible
filetype off


" Install Vundle plugins
if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'justinmk/vim-sneak'
Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'mhinz/vim-signify'
Plugin 'rking/ag.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tmux-plugins/vim-tmux'

call vundle#end()


" Filetype detection and auto-indent on
filetype plugin indent on

" Syntax highlighting
syntax on

" Colourscheme
set background=dark
colorscheme solarized

" Highlight cursor line
set cursorline

" ---more--- like less
set more

" Line numbers
set number
set numberwidth=5

" Lines above/below cursor
set scrolloff=3

" Line wrapping off
set nowrap

" Show commands being typed
set showcmd

" Window title
set title

" Disable beep and flashing
set vb t_vb=

" Better autocomplete
set wildmenu
set wildmode=longest,list

" Allow buffer change without save
set hidden

" Larger history
set history=1000

" Always show status line
set laststatus=2

" Show <tab>
set listchars=tab:>\
set list

" Disable mouse
set mouse=

" Keep cursor column
set nostartofline

" Faster redraws
set ttyfast

" Live search
set incsearch

" Bracket matching
set matchtime=2
set matchpairs+=<:>
set showmatch

" Refresh if changed
set autoread
set confirm

" Never autowrite
set noautowrite

" Turn off backups
set nobackup

" Persistent undo
if has('persistent_undo') && exists("&undodir")
    set undodir=$HOME/.vim/undo
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" Auto indent
set autoindent

" Smart backspace
set backspace=indent,eol,start

" No tabs
set expandtab

" Ignore case by default
set ignorecase

" Tabs
set shiftround
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4

" Sensitive to uppercase
set smartcase

" Disable swap files
set noswapfile

