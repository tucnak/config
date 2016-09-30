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
set fileencoding=utf8
set undolevels=1000
set backspace=indent,eol,start
set clipboard="*
set mouse-=a
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
command! Expand call emmet#expandAbbr(3,"")

" clear highlighting on <ESC> in normal mode
nnoremap <CR> :noh<CR><CR>

" handy redo
nnoremap U :redo<CR>

" tab navigation
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <Tab> :tabnext<CR>

" line swaps
function! SwapUp()
   if line(".") == 1
       return
   endif
   call feedkeys("ddkP")
endfunction

function! SwapDown()
   if line(".") == line("$")
       return
   endif
   call feedkeys("ddp")
endfunction

nnoremap <S-Up> :call SwapUp()<CR>
nnoremap <S-Down> :call SwapDown()<CR>

function! Paste()
    :set paste
    normal! "*P`]
    :set nopaste
endfunction

" clever copy pasting
nnoremap <C-v> :call Paste()<CR>
inoremap <C-v> <ESC>:call Paste()<CR>i
vnoremap <C-c> "*y
vnoremap <C-x> "*d
