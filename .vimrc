syntax enable
filetype plugin indent on
au BufWritePre * :%s/\s\+$//e
au BufNewFile,BufRead,BufReadPost *.md set syntax=mediawiki
au FileType markdown setlocal tw=80 wrap expandtab softtabstop=4 shiftwidth=4
au FileType html setlocal wrap
autocmd FileType go nmap <Leader><F1> :GoDoc<CR>
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ.;ABCDEFGHIJKLMNOPQRSTUVWXYZ:/,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set keywordprg=":help"
set wrap
set linebreak
set nobackup
set nowritebackup
set noswapfile
set nocompatible
set noshowmode
set number
set ruler
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
call plug#end()

set t_Co=256
colorscheme pablo
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

nmap <Leader>a :%y*<CR>
nmap <Leader>s :w<CR>
nmap <Leader>goi :GoImports<CR>
nmap <Leader>rg :Rg<CR>
nmap <Leader>f :tabe<CR>:Files<CR>
nmap <Leader>F :tabe<CR>:GFiles<CR>

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

imap <Leader><Tab> <C-x><C-o>
imap <Leader>e <ESC>:call emmet#expandAbbr(3,"")<CR>i
imap <Leader>s <ESC>:w<CR>a
imap <S-Tab> <BS>

vmap tt :s/\t/    /<CR>
