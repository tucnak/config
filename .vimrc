filetype plugin indent on
syntax enable

set wrap
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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab
set ruler
set fileencoding=utf8
set backspace=indent,eol,start
set undolevels=1000
set clipboard="*
set mouse-=a
set completeopt-=preview

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
call plug#end()

source ~/.vim/functions.vim
noremap <C-c> "*y
noremap <C-A> :%y*<CR>
source ~/.vim/paste.vim

colorscheme elflord
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }
"let g:go_fmt_command = "goimports"
let g:go_fmt_command = "gofmt"

autocmd FileType markdown setlocal wrap
autocmd FileType html setlocal wrap
autocmd FileType go hi Error NONE
autocmd BufWritePre * :%s/\s\+$//e

"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

noremap U :redo<CR>
nnoremap <CR> :noh<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Down> :call SwapDown()<CR>
nnoremap <S-Up> :call SwapUp()<CR>
inoremap <C-E> <ESC>:call emmet#expandAbbr(3,"")<CR>i
