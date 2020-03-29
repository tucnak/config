command Goi GoImports

filetype plugin indent on
syntax enable

set wrap
set linebreak
set nobackup
set nowritebackup
set noswapfile

set nocompatible
set number
set norelativenumber
set showbreak=+++
set textwidth=0
set wrapmargin=0
set showmatch
set hlsearch
set smartcase
set ignorecase
set incsearch
set expandtab
set autoindent
set smartindent
set smarttab
set ruler
set fileencoding=utf8
set backspace=indent,eol,start
set undolevels=1000
set clipboard=unnamed
set mouse=a
set ttymouse=xterm2
set completeopt-=preview

"set expandtab
"set copyindent
"set preserveindent
"set softtabstop=4
set noexpandtab
set tabstop=8
set shiftwidth=8

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'manu-mannattil/vim-longlines'
Plug 'rhysd/vim-grammarous'
Plug 'dag/vim-fish'
"Plug 'gabrielelana/vim-markdown'
call plug#end()

source ~/.vim/functions.vim
source ~/.vim/paste.vim

colorscheme elflord
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }
"let g:go_fmt_command = "goimports"
let g:go_fmt_command = "gofmt"

au BufNewFile,BufRead,BufReadPost *.md set syntax=mediawiki
autocmd FileType markdown setlocal wrap expandtab softtabstop=4 shiftwidth=4
autocmd FileType html setlocal wrap
autocmd FileType go hi Error NONE
autocmd BufWritePre * :%s/\s\+$//e

"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

noremap U :redo<CR>
noremap <C-c> "*y
noremap <C-v> "*p
noremap <C-a> :%y*<CR>
nnoremap <CR> :noh<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Down> :call SwapDown()<CR>
nnoremap <S-Up> :call SwapUp()<CR>
inoremap <C-E> <ESC>:call emmet#expandAbbr(3,"")<CR>i
