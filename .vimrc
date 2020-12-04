syntax enable
filetype plugin indent on
au BufWritePre * :%s/\s\+$//e
"au BufNewFile,BufRead,BufReadPost *.md set syntax=mediawiki
"au FileType markdown setlocal tw=80 wrap
au FileType html setlocal wrap
au FileType go nmap <leader><F1> :GoDoc<CR>
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня.;abcdefghijklmnopqrstuvwxyz/
set shell=/usr/local/bin/fish
set keywordprg=":help"
set splitright
set wrap
set linebreak
set nobackup
set nowritebackup
set noswapfile
set nocompatible
set noshowmode
set number
set noruler
set norelativenumber
set showmatch
set hlsearch
set smartcase
set ignorecase
set incsearch
set autoindent
set smartindent
set preserveindent
set smarttab
set noexpandtab
set tabstop=4
set shiftwidth=4
set showbreak=
set textwidth=0
set wrapmargin=0
set fileencoding=utf8
set virtualedit=onemore
set backspace=indent,eol,start
set undolevels=1000
"set clipboard=unnamed
set mouse=a
set ttymouse=xterm2
set completeopt=longest,noinsert,menuone,noselect
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

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
Plug 'wellle/targets.vim'
Plug 'tucnak/vim-playfount'
Plug 'junegunn/goyo.vim'
call plug#end()

set t_Co=256
colorscheme default
"hi Normal guibg=NONE ctermbg=NONE
"hi Normal ctermbg=NONE
"hi nonText ctermbg=NONE
"hi Comment ctermbg=NONE
"hi LineNr ctermfg=gray ctermbg=NONE
"hi Pmenu ctermbg=gray guibg=gray
"hi! link htmlTag Title
"hi! link htmlString htmlArg
"hi! link htmlValue htmlArg
"hi! link htmlEndTag Title

let mapleader = ","
let g:lightline = {
	\ 'colorscheme': 'seoul256',
	\ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
    \ }
let g:go_fmt_command = "gofmt"

nmap <leader>a :%y*<CR>
nmap <leader>s :w<CR>
nmap <silent> <leader>goi :GoImports<CR>
nmap <silent> <leader>gob :GoBuild<CR>
nmap <leader>rg :Rg<CR>
nmap <leader>f :tabe<CR>:Files<CR>
nmap <leader>F :tabe<CR>:GFiles<CR>
nmap <leader>p :set paste<CR>
nmap <leader>np :set nopaste<CR>
nmap <silent> <leader>qj :cn<CR>
nmap <silent> <leader>qk :cp<CR>

nmap <silent> U :redo<CR>
nmap <silent> Г :redo<CR>
nmap <silent> <Enter> :noh<CR>
nmap <silent> <Tab> :tabnext<CR>
nmap <silent> <S-Tab> :tabprevious<CR>
vmap <silent> <Right> l
vmap <silent> <Left> h
vmap <silent> <Up> gk
vmap <silent> <Down> gj
nmap <silent> <Right> l
nmap <silent> <Left> h
nmap <silent> <Up> gk
nmap <silent> <Down> gj

imap <leader><Tab> <C-x><C-o>
imap <leader>e <ESC>:call emmet#expandAbbr(3,"")<CR>i
imap <leader>s <ESC>:w<CR>a
imap <S-Tab> <BS>

vmap tt :s/\t/    /<CR>
