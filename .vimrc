colorscheme default
syntax enable
filetype plugin indent on
runtime macros/matchit.vim

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
set ruler
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
set hidden
set backspace=indent,eol,start
set undolevels=1000
set mouse=a
set ttymouse=xterm2
set completeopt=longest,noinsert,menuone,noselect
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set fillchars=vert:\ ,fold:-,diff:-
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня.хъ;abcdefghijklmnopqrstuvwxyz/[]
set shell=/bin/zsh
set keywordprg=":help"
set t_Co=256

au BufWritePre * :%s/\s\+$//e " trailing spaces
au FileType json,dart set sw=2 ts=2 et
au FileType c,cpp,java setlocal commentstring=//\ %s
au FileType sql setlocal commentstring=--\ %s
" relative numbers in visual mode
au CursorMoved * if mode() !~# "[vV\<C-v>]" | set nornu | endif
vnoremap <silent> <Esc> <Esc>:set nornu<CR>
nnoremap <silent> v :set rnu<CR>v
nnoremap <silent> V :set rnu<CR>V
nnoremap <silent> <C-v> <C-v>:<C-u>set rnu<CR>gv

call plug#begin()
" Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'voldikss/vim-floaterm'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'wellle/targets.vim'
Plug 'fatih/vim-go'
Plug 'mattn/emmet-vim'
Plug 'BeneCollyridam/futhark-vim'
Plug 'tucnak/vim-playfount'
Plug 'junegunn/goyo.vim'
"very slow Plug 'sebdah/vim-delve'
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'JuliaEditorSupport/julia-vim'
call plug#end()

let g:mkdp_preview_options = {
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'content_editable': v:false,
    \ 'disable_filename': 1
    \ }
let g:mkdp_markdown_css = expand('~/.vim/markdown.css')

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

" workaround
nmap gx yiW:!open <cWORD><CR> <C-r>" & <CR><CR>

let mapleader = ","
nmap <leader>s :w<CR>
nmap <leader>v :vert<Space>
nmap <leader>g :Buffers<CR>
nmap <leader>m :Marks<CR>
nmap <leader>f :Files<CR>
nmap <leader>db :bp<bar>sp<bar>bn<bar>bd!<CR>
nmap <leader>rg :Rg<Space>
nmap <leader>md :MarkdownPreviewToggle<CR>
nmap <silent> <leader>i :set modifiable<CR>
nmap <silent> <leader>p :set paste<CR>
nmap <silent> <leader>np :set nopaste<CR>
nmap <silent> <leader>wc :call Readtime()<CR>
imap <leader><Tab> <C-x><C-o>

imap <S-Tab> <C-o>
imap <silent> <leader>/ <ESC>:call emmet#expandAbbr(3,"")<CR>i
imap <leader>yo ё
imap <leader>Yo Ё
nmap <silent> U :redo<CR>
nmap <silent> Г :redo<CR>
nmap <silent> <Enter> :noh<CR>
vmap <silent> tt :s/\t/    /<CR>:noh<CR>
vmap <silent> TT :s/    /\t/<CR>:noh<CR>

nmap <leader>. :make<CR>
imap <leader>, <ESC>:w<CR>a
nmap <leader>, :w<CR>
nmap <silent> <leader>` :FloatermToggle<CR>
imap <silent> <leader>` <ESC>:FloatermToggle<CR>
tmap <silent> <leader>` <C-\><C-n>:FloatermToggle<CR>
tmap <leader>, <C-\><C-n>

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

"go specific binds
au FileType go nmap gos :!speed<Space>
au FileType go nmap gop :!probe<Space>
au FileType go nmap <silent> gob :GoBuild<CR>
au FileType go nmap <silent> goi :GoImports<CR>
au FileType go nmap <silent> gor :GoRename<CR>

let g:floaterm_title=''
let g:lightline = {
	\ 'colorscheme': 'landscape',
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

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
