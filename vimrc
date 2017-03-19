" 
" Lots of settings/inspiration from
"     https://dougblack.io/words/a-good-vimrc.html
"


" Plugins {{{

" Install Vundle plugin
if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'


Plugin 'altercation/vim-colors-solarized'   " Colour scheme
Plugin 'bling/vim-airline'                  " Status bar plugin
Plugin 'chiel92/vim-autoformat'             " Integration with code formatters (clang-format etc)
Plugin 'christoomey/vim-tmux-navigator'     " Use tmux keys to move between windows
Plugin 'flowtype/vim-flow'                  " Javascript type checking
Plugin 'justinmk/vim-sneak'                 " Motion to jump to characters
Plugin 'ludovicchabant/vim-lawrencium'      " Mercurial integration
Plugin 'mhinz/vim-signify'                  " Diffs in left-hand column
Plugin 'rizzatti/dash.vim'                  " Integration with Dash
Plugin 'rking/ag.vim'                       " Integration with Silver Searcher
Plugin 'rust-lang/rust.vim'                 " Rust syntax highlighting
Plugin 'scrooloose/nerdcommenter'           " Comment out blocks of code
Plugin 'tikhomirov/vim-glsl'                " GLSL syntax highlighting
Plugin 'tmux-plugins/vim-tmux'              " Syntax highlighting for tmux.conf
Plugin 'tpope/vim-surround'                 " Quotes and parenthesis handling
Plugin 'Valloric/YouCompleteMe'             " Code completion
Plugin 'vim-jp/vim-cpp'                     " C++11 syntax highlighting

call vundle#end()


" }}}

" Colours {{{

syntax enable           " Turn on syntax highlights
set background=dark     " Dark background   
colorscheme solarized   " Colour scheme

" }}}

" Misc {{{

set nocompatible        " Turn vi compatibility off
set ttyfast             " Faster redraws
set lazyredraw          " Don't redraw during macros
set vb t_vb=            " Disable beep/flash
set backspace=indent,eol,start  " Proper backspace behaviour
set mouse=              " Disable mouse

" }}}

" Folding {{{


" }}}

" Layout {{{

set nostartofline       " Don't return cursor to start of line
set cursorline          " Highlight line containing cursor
set more                " Show ---more--- after full page of output
set nowrap              " Disable line wrapping
set scrolloff=3         " Ensure always a given number of lines around cursor when scrolling
set showcmd             " Show command as typed
set title               " Set window title to filename
set wildmenu            " Turn on autocomplete menu
set wildmode=longest,list

" }}}

" Line numbering {{{

set number              " Enable line numbers
set numberwidth=5       " Use a fixed width

" }}}

" Spaces & Tabs {{{

set tabstop=4           " 4 spaces per tab
set softtabstop=4       " 4 spaces per tab
set expandtab           " Use spaces for tab
set shiftwidth=4        " 4 spaces for auto-indent
set autoindent          " Auto-indent new lines
set smarttab            " First tab auto-indents
set modelines=1         " Optionally use modeline at bottom of file to override settings
filetype indent on      " Turn auto-indent on for all filetypes
filetype plugin on      " Turn plugins on for all filetypes
set list                " Show tabs
set listchars=tab:>-    " Display tab as '>---'

" }}}

" Save & Undo {{{

set autoread            " Reload file if changed outside of vim
set confirm             " Confirm losing changes
set noautowrite         " Don't autosave
set nobackup            " Don't write backups
set noswapfile          " No swap files
set hidden              " Don't save when swapping buffer
set history=1000        " ':' command history
if has('persistent_undo') && exists("&undodir")
    set undodir=$HOME/.vim/undo     " Folder for undo files
    set undofile        " Save undo history for files
    set undolevels=1000 " Size of undo history
endif

" }}}

" Search {{{

set incsearch           " Enable incremental search
set ignorecase          " Ignore case when searching...
set smartcase           " ...unless uppercase in search pattern
set showmatch           " Show matching braces on insert...
set matchtime=2         " ...for 0.2secs

" }}}

" Status bar {{{

set laststatus=2        " Always show status line
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" }}}

" Leader {{{

let mapleader = ","     " Remap leader to ','
let g:mapleader = ","


" }}}

" Rust {{{

let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']
let g:rustc_path = $HOME."/.cargo/bin/rustc"
let g:racer_cmd = $HOME."/.cargo/bin/racer"
let $RUST_SRC_PATH = $HOME."/.cargo/rustc-nightly-1.12/src"

" }}}


" vim:foldmethod=marker:foldlevel=0
