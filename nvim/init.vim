colorscheme slate
syntax enable
packadd matchit
filetype plugin indent on

noremap Y yy

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
set noexpandtab
set nonu
set nornu
set nosol
set noshowcmd
set noshowmode
set noswapfile
set nowritebackup
set preserveindent
set shiftwidth=4
set showbreak=
set showmatch
set smartcase
set smartindent
set smarttab
set splitbelow
set splitright
set tabstop=4
set notermguicolors
set textwidth=0
set timeoutlen=500
set undolevels=1000
set virtualedit=onemore
set wrap
set wrapmargin=0

nnoremap <f10> :echo synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")<CR>

hi Normal ctermbg=NONE guibg=#ffffeb
hi Folded guibg=NONE ctermbg=NONE
hi FoldColumn guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi Comment ctermfg=gray
hi Statement ctermfg=black "cterm=bold
hi Visual term=NONE ctermfg=lightmagenta
hi Search ctermbg=lightyellow
hi IncSearch ctermfg=10 ctermbg=lightyellow cterm=NONE
hi Pmenu ctermbg=white ctermfg=black
" hi Identifier guifg=black
" hi Type cterm=bold
" hi clear Constant
" hi clear Search

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'ojroques/vim-oscyank'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'
Plug 'wellle/targets.vim'
Plug 'voldikss/vim-floaterm'
Plug 'killphi/vim-ebnf'
Plug 'tommcdo/vim-exchange'
Plug 'mattn/emmet-vim'
Plug 'tucnak/vim-playfount'
Plug 'evanleck/vim-svelte'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

function! Foldtext()
  " let nl = v:foldend - v:foldstart + 1
  let head = substitute(getline(v:foldstart), "^[\t ]*", "", 1)
  let prefix = repeat(' ', indent(v:foldstart))
  return prefix . head
endfunction
set foldtext=Foldtext()

let mapleader = ","
imap <silent> <C-e> <C-o>:call emmet#expandAbbr(3,"")<CR>
nmap <leader>, :w<CR>
imap <leader>, <ESC>:w<CR>a
nmap <leader><Tab> :Buffers<CR>
nmap <leader>m :Marks<CR>
nmap <leader>f :Files<CR>
nmap <leader>gf :GFiles<CR>
nmap <leader>rg :Rg<Space>
nmap <leader>v :vert<Space>
nmap <silent> <S-Tab> <C-o>
nmap <silent> <leader>nu :set invnumber<CR>
nmap <silent> ZX :bp<bar>sp<bar>bn<bar>bw!<CR>
nmap <silent> <leader>/ :set invpaste<CR>
nmap <silent> U :redo<CR>
nmap <silent> Г :redo<CR>
vmap <silent> tt :s/\t/    /<CR>:noh<CR>
vmap <silent> TT :s/    /\t/<CR>:noh<CR>
nmap <silent> <Enter> :set invhlsearch<CR>
" experimental idea
nmap <silent> [a [b
nmap <silent> ]d ]b

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)
nmap <silent> ff <Plug>(coc-format-selected)
nmap <silent> ]c :CocNext<CR>
nmap <silent> [c :CocPrev<CR>
nmap <silent> <leader>cr :CocRestart<CR>

nmap <silent> t :FloatermToggle<CR>
nmap <silent> T :FloatermNew<CR>
nmap <silent> ]t :FloatermNext<CR>
nmap <silent> [t :FloatermPrev<CR>
tmap <silent> ]t <C-\><C-n>:FloatermNext<CR>i
tmap <silent> [t <C-\><C-n>:FloatermPrev<CR>i
tmap <silent> ,, <C-\><C-n>

" remove trailing spaces
au BufWritePre * :%s/\s\+$//e
" reload .vimrc on save
au FileType vim nmap <buffer> <leader>, :w<CR>:source %<CR>
"au FileType svelte setlocal indentexpr=HtmlIndent()
au FileType c,cpp,java setlocal commentstring=//\ %s
au FileType sql setlocal commentstring=--\ %s
" tab policy
au FileType vim,javascript,python setlocal sw=2 ts=2
au FileType go,html,markdown setlocal sw=4 ts=4
au FileType sql setlocal expandtab
au FileType html setlocal foldmethod=indent
au FileType go nmap <buffer> <leader>. :w<CR>:!goimports -w %<CR><CR>

au BufWinEnter * set laststatus=0
set ruler
set statusline=
" set statusline+=%#PmenuSel#
" set statusline+=%#LineNr#
" set statusline+=\ %f
" set statusline+=%m\
" set statusline+=%=
" set statusline+=%#CursorColumn#
" set statusline+=\ %y
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" set statusline+=\[%{&fileformat}\]
" set statusline+=\ %p%%
" set statusline+=\ %l:%c
" set statusline+=\

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

nmap <silent> gp "=substitute(@@, '\(^[ \t]*\)\\|\n*', '', 'g')<CR>p
nmap <silent> gP "=substitute(@@, '\(^[ \t]*\)\\|\n*', '', 'g')<CR>P
vmap <silent> gp "=substitute(@1, '\(^[ \t]*\)\\|\n*', '', 'g')<CR>p
command! Regwipe for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

nmap <leader>y <Plug>OSCYank
nmap <leader>Y V:OSCYank<CR>
vnoremap <leader>y :OSCYank<CR>
nmap <leader>cc :Copilot enable<CR>
nmap <leader>cx :Copilot disable<CR>
imap <silent> <leader><Tab> <Plug>(copilot-next)
imap <silent> <leader><S-Tab> <Plug>(copilot-previous)

let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'python': v:true,
      \ 'go': v:false,
      \ }
let g:go_fmt_autosave = 1
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_require_pragma = 0
