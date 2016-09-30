filetype off
filetype plugin indent on
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
set nocompatible
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
set clipboard^=unnamed
set completeopt-=preview

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
Plugin 'mattn/emmet-vim'
call vundle#end()

" remove trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" emmet expand with :Expand
command Expand call emmet#expandAbbr(3,"")

" tab navigation
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
