"colorscheme molokai
set completeopt-=preview

set nocompatible                    " required
filetype off                        " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'garyburd/go-explorer'
call vundle#end()                   " required
filetype plugin indent on           " required

set number
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab
set ruler
set undolevels=1000
set backspace=indent,eol,start
set pastetoggle=<F9>

syntax on
