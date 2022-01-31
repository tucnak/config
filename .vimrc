colorscheme default
syntax enable
packadd matchit
filetype plugin indent on

nnoremap <f10> :echo synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")<CR>

set autoindent
set backspace=indent,eol,start
set colorcolumn=0
set completeopt=longest,noinsert,menuone,noselect
set exrc
set fileencoding=utf8
set fillchars=vert:\ ,fold:-,diff:-
set foldcolumn=5
set foldlevel=5
set foldmethod=syntax
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set hidden
set hlsearch
set ignorecase
set incsearch
set keywordprg=":help"
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня.хъ;abcdefghijklmnopqrstuvwxyz.[]
set lazyredraw
set linebreak
set mouse=a
set nobackup
set nocompatible
set noexpandtab
set nornu
set nosol
set noshowcmd
set noshowmode
set noswapfile
set nowritebackup
set nu
set preserveindent
set shell=/usr/local/bin/fish
set shiftwidth=4
set showbreak=
set showmatch
set smartcase
set smartindent
set smarttab
set splitbelow
set splitright
set t_Co=256
set tabstop=4
set termguicolors
set textwidth=0
set timeoutlen=500
set undolevels=1000
set virtualedit=onemore
set wrap
set wrapmargin=0

hi Folded guibg=NONE ctermbg=NONE
hi FoldColumn guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi CocFadeOut guibg=lightred ctermbg=red

hi Normal guibg=#ffffeb

hi Comment guifg=darkgray
hi Identifier guifg=black
hi Constant cterm=italic gui=italic guifg=brown
hi Type cterm=bold
hi Statement cterm=bold

call plug#begin()
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['autoindent'] " slow
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'voldikss/vim-floaterm'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/targets.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'
Plug 'tucnak/vim-playfount'
Plug 'killphi/vim-ebnf'
Plug 'tommcdo/vim-exchange'
Plug 'mattn/emmet-vim'
Plug 'evanleck/vim-svelte'
call plug#end()

" open url workaround
nmap <silent> gx yiW:!open <cWORD><CR> <C-r>" & <CR><CR>

" location list
nnoremap <silent> [f :lprevious<CR>
nnoremap <silent> ]f :lnext<CR>

function! Foldtext()
  " let nl = v:foldend - v:foldstart + 1
  let head = substitute(getline(v:foldstart), "^[\t ]*", "", 1)
  let prefix = repeat(' ', indent(v:foldstart))
  return prefix . head
endfunction
set foldtext=Foldtext()

let mapleader = ","
nmap <leader>, :w<CR>
imap <leader>, <ESC>:w<CR>a
nmap <leader>, :w<CR>
nmap <leader><Tab> :Buffers<CR>
nmap <leader>m :Marks<CR>
nmap <leader>f :Files<CR>
nmap <leader>gf :GFiles<CR>
nmap <leader>rg :Rg<Space>
nmap <leader>v :vert<Space>
nmap <silent> <leader>i :set modifiable<CR>
nmap <silent> <leader>p :set paste<CR>
nmap <silent> <leader>np :set nopaste<CR>
nmap <silent> <leader>x :bp<bar>sp<bar>bn<bar>bd!<CR>
"imap <leader><Tab> <C-x><C-o>
imap <silent> <leader>/ <ESC>:call emmet#expandAbbr(3,"")<CR>i
imap <leader>yo ё
imap <leader>Yo Ё
nmap <silent> U :redo<CR>
nmap <silent> Г :redo<CR>
vmap <silent> tt :s/\t/    /<CR>:noh<CR>
vmap <silent> TT :s/    /\t/<CR>:noh<CR>
nmap <silent> <Enter> :set invhlsearch<CR>
" experimental idea
nmap <silent> [a [b
nmap <silent> ]d ]b

" remove trailing spaces
au BufWinEnter * set laststatus=0
au BufWritePre * :%s/\s\+$//e
" reload .vimrc on save
au BufWritePost .vimrc nmap <buffer> <leader>, :w<CR>:source %<CR>

command! Goimports exec ":silent !goimports -w ." | exec ":e"
au FileType go nmap <buffer> <leader>, :w<CR>:Goimports<CR>
au FileType go nmap <buffer> gop :!probe<Space>
au FileType go nmap <buffer> gos :!speed<Space>
"au FileType svelte setlocal indentexpr=HtmlIndent()
au FileType c,cpp,java setlocal commentstring=//\ %s
au FileType sql setlocal commentstring=--\ %s
" tab policy
au FileType vim,javascript,python setlocal sw=2 ts=2
au FileType go setlocal sw=4 ts=4

imap <expr> <leader><Tab> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)
nmap <silent> ]c :CocNext<CR>
nmap <silent> [c :CocPrev<CR>

" multi-line navigation
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
nnoremap о gj
nnoremap по j
nnoremap л gk
nnoremap пл k
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

" copilot
let g:copilot_filetypes = {
  \ '*': v:false,
  \ 'python': v:true,
  \ 'go': v:true,
  \ }

" floating terminal
let g:floaterm_title=''
nmap <silent> <leader>` :FloatermToggle<CR>
imap <silent> <leader>` <ESC>:FloatermToggle<CR>
tmap <silent> <leader>` <C-\><C-n>:FloatermToggle<CR>
tmap <leader>, <C-\><C-n>

" word count, read time
nmap <silent> <leader>wc :call Readtime()<CR>
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
