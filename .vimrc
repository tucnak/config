syntax enable
filetype plugin indent on
au BufNewFile,BufRead,BufReadPost *.md set syntax=mediawiki
au FileType markdown setlocal tw=80 wrap expandtab softtabstop=4 shiftwidth=4
au FileType html setlocal wrap
au BufWritePre * :%s/\s\+$//e

set wrap
set linebreak
set nobackup
set nowritebackup
set noswapfile
set nocompatible
set number
set norelativenumber
set showbreak=
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
set virtualedit=onemore
set backspace=indent,eol,start
set undolevels=1000
set clipboard=unnamed
set mouse=a
set ttymouse=xterm2
set completeopt=longest,noinsert,menuone,noselect
set preserveindent
set noexpandtab
set tabstop=4
set shiftwidth=4

call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'mattn/emmet-vim'
Plug 'dag/vim-fish'
Plug 'othree/html5.vim'
Plug 'BeneCollyridam/futhark-vim'
call plug#end()

colorscheme laederon
hi Normal guibg=NONE ctermbg=NONE
hi LineNr ctermfg=gray ctermbg=NONE
hi Pmenu ctermbg=gray guibg=gray
hi! link htmlTag Title
hi! link htmlString htmlArg
hi! link htmlValue htmlArg
hi! link htmlEndTag Title

let g:lightline = {'colorscheme': 'seoul256'}
let g:go_fmt_command = "gofmt"
let mapleader = ","
imap <Leader><Tab> <C-x><C-o>
imap <Leader>e <ESC>:call emmet#expandAbbr(3,"")<CR>i
nmap <Leader>a :%y*<CR>
nmap <Leader>s :w<CR>
imap <Leader>s <Esc>:w<CR>a
nmap <Leader>w :GoImports<CR>
nmap <Leader>rg :Rg<CR>
nmap <Leader>f :tabe<CR>:GFiles<CR>
nmap <Leader>F :tabe<CR>:Files<CR>

nmap <Enter> :noh<CR>
nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprevious<CR>

nmap U :redo<CR>
vmap tt :s/\t/    /<CR>
vmap r :s/
imap .<Tab> .<C-x><C-o>
