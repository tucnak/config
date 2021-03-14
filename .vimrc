colorscheme default
syntax enable
filetype plugin indent on

set exrc
set wrap
set linebreak
set noshowmode
set noshowcmd
set nobackup
set nowritebackup
set noswapfile
set nocompatible
set number
set nornu
set noruler
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
set splitright
set lazyredraw
set foldcolumn=1
set tabstop=4
set shiftwidth=4
set showbreak=
set textwidth=0
set wrapmargin=0
set fileencoding=utf8
set virtualedit=onemore
set backspace=indent,eol,start
set undolevels=1000
set mouse=a
set ttymouse=xterm2
set completeopt=longest,noinsert,menuone,noselect
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня.хъ;abcdefghijklmnopqrstuvwxyz/[]
set shell=/usr/local/bin/fish
set keywordprg=":help"
set t_Co=256

au BufWritePre * :%s/\s\+$//e " trailing spaces
au FileType json set sw=2 et
au FileType c,cpp,java setlocal commentstring=//\ %s
au FileType sql setlocal commentstring=--\ %s
au FileType go nmap <leader>h :GoDoc<CR>
" relative numbers in visual mode
au CursorMoved * if mode() !~# "[vV\<C-v>]" | set nornu | endif
vnoremap <silent> <Esc> <Esc>:set nornu<CR>
nnoremap <silent> v :set rnu<CR>v
nnoremap <silent> V :set rnu<CR>V
nnoremap <silent> <C-v> <C-v>:<C-u>set rnu<CR>gv

call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'BeneCollyridam/futhark-vim'
Plug 'wellle/targets.vim'
Plug 'tucnak/vim-playfount'
Plug 'junegunn/goyo.vim'
Plug 'tckmn/vim-minisnip'
Plug 'sebdah/vim-delve'
call plug#end()

fun! Readtime()
	let l:wc = wordcount()
	let l:chars = l:wc['chars']
	let l:words = l:wc['words']
    try
        exe "silent normal! g\<C-g>"
        echo printf('%d chars, %d words, %d pages, %.0fmin readtime',
        	\ l:chars, l:words,
			\ 1 + l:words / 250,
			\ ceil(l:words / 200.0))
    endtry
endfun

let mapleader = ","
nmap <leader>s :w<CR>
nmap <leader>v :vert<Space>
nmap <leader>b :Buffers<CR>
nmap <leader>m :Marks<CR>
nmap <leader>f :Files<CR>
nmap <leader>gf :GFiles<CR>
nmap <leader>rg :Rg<Space>
nmap <silent> <leader>i :set modifiable<CR>
nmap <silent> <leader>p :set paste<CR>
nmap <silent> <leader>np :set nopaste<CR>
nmap <silent> <leader>goi :GoImports<CR>
nmap <silent> <leader>gob :GoBuild<CR>
nmap <silent> <leader>wc :call Readtime()<CR>
imap <leader><Tab> <C-x><C-o>
imap <leader>ex <ESC>:call emmet#expandAbbr(3,"")<CR>i
imap <leader>s <ESC>:w<CR>a
imap <leader>yo ё
imap <leader>Yo Ё
nmap <silent> U :redo<CR>
nmap <silent> Г :redo<CR>
nmap <silent> <Enter> :noh<CR>
nmap <silent> <Tab> :tabnext<CR>
nmap <silent> <S-Tab> :tabprevious<CR>
vmap <silent> tt :s/\t/    /<CR>:noh<CR>
vmap <silent> TT :s/    /\t/<CR>:noh<CR>

" controversial, but probably good
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
" therefore
nnoremap <silent> <Left> h
nnoremap <silent> <Down> j
nnoremap <silent> <Up> k
nnoremap <silent> <Right> l
vnoremap <silent> <Left> h
vnoremap <silent> <Down> j
vnoremap <silent> <Up> k
vnoremap <silent> <Right> l
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

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
