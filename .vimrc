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
set completeopt=longest,noinsert,menuone,noselect
"set copyindent
set preserveindent
"set softtabstop=4
set noexpandtab
set tabstop=4
set shiftwidth=4
set noshowmode

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rhysd/vim-grammarous'
Plug 'dag/vim-fish'
call plug#end()

source ~/.vim/functions.vim
source ~/.vim/paste.vim

colorscheme laederon
hi Normal guibg=NONE ctermbg=NONE
hi LineNr ctermfg=gray ctermbg=NONE
hi Pmenu ctermbg=gray guibg=gray
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

nnoremap U :redo<CR>
nnoremap <CR> :noh<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Up> :call SwapUp()<CR>
nnoremap <S-Down> :call SwapDown()<CR>
inoremap <C-E> <ESC>:call emmet#expandAbbr(3,"")<CR>i
nnoremap <C-a> :%y*<CR>
nnoremap <C-i> :GoImports<CR>
inoremap <C-c> <C-x><C-o>
