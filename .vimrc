	" TODO: may differ
set shell=/opt/homebrew/bin/fish
syntax enable
packadd matchit
filetype plugin indent on
colorscheme default

set conceallevel=2
set noautoindent
set signcolumn=yes
set colorcolumn=0
set completeopt=longest,noinsert,menuone,noselect
set exrc
set fileencoding=utf8
set fillchars=eob:\ ,vert:\ ,fold:-,foldopen:-,foldclose:+,diff:-
set foldcolumn=7
set foldlevel=10
set foldmethod=syntax
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set hidden
set nohlsearch
set ignorecase
set incsearch
set keywordprg=":help"
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня.хъ;abcdefghijklmnopqrstuvwxyz.[]
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
set nonu
set preserveindent
set showbreak=
set showmatch
set smartcase
set smartindent
set smarttab
set splitbelow
set splitright
set t_Co=256
set textwidth=0
set timeoutlen=500
set undolevels=1000
set virtualedit=onemore
set wrap
set wrapmargin=0

	" wipes the registers clean in secure files
command! Wipe for i in range(34,122) |
	\ silent! call setreg(nr2char(i), []) |
	\ endfor

	" load .vimrc and .gvimrc
command! Rc source ~/.vimrc | source ~/.gvimrc

call plug#begin()
	" foundation
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomtom/tcomment_vim'
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'justinmk/vim-sneak'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'voldikss/vim-floaterm'
Plug 'mattn/emmet-vim'

	" language servervs
Plug 'josa42/coc-go'
Plug 'neoclide/coc-tsserver'
Plug 'coc-extensions/coc-svelte'
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'mhinz/vim-mix-format'

	" not language servers
Plug 'github/copilot.vim'
Plug 'rizzatti/dash.vim'
Plug 'nickeb96/fish.vim'
Plug 'fatih/vim-go'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'elixir-editors/vim-elixir'
Plug 'ap/vim-css-color'
Plug 'jasonlong/vim-textobj-css'

	" we. like. tpope
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-dadbod'

	" internal
Plug 'git@github.com:tucnak/vim-playfount'
Plug 'tucnak/vim-gpt'

call plug#end()

	" in terminal i want blue, in gui- i want yellow
hi Normal guibg=#f0f7ff
hi Comment guifg=darkgray
hi Identifier guifg=black
hi Constant term=italic gui=italic
hi Type term=bold
hi Statement term=bold
hi SignColumn ctermbg=NONE guibg=NONE
hi clear Folded
hi clear FoldColumn

	" floating autocomplete pop
fun! TabOrNot() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endf
inoremap <silent><expr> <Tab>
 	\ coc#pum#visible() ? coc#pum#next(1):
 	\ TabOrNot() ? "\<Tab>" :
 	\ coc#refresh()
inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ?
			\ coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

	" universally good looking fold labels
fun! s:foldtext()
	let head = substitute(getline(v:foldstart), "^[\t ]*", "", 1)
	let prefix = repeat(' ', indent(v:foldstart))
	return prefix . head
endf
set foldtext=s:foldtext()

	" print word count, approx. read time
fun! s:readtime()
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
endf
nmap <silent> <leader>wc :call <SID>readtime()<CR>

fun! s:autochdir()
	if &buftype ==# 'terminal'
		set noautochdir
		return
	endif
	if &autochdir
		set noautochdir
	else
		set autochdir
	endif
	echom getcwd() . ' (' . &autochdir . ')'
endf
nmap <silent> <leader>~ :call <SID>autochdir()<CR>

	" who doesn't like a comma?
let mapleader = ","
nmap <leader>v :vert<Space>
"nmap <leader>, :w<CR>
"imap <leader>, <Cmd>:w<CR>
nmap <silent> ZX :bp<bar>sp<bar>bn<bar>bw!<CR>
nmap <silent> gx yiW:!open <cWORD><CR> <C-r>" & <CR><CR>
nmap <silent> <TAB> <C-i>
nmap <silent> <S-TAB> <C-o>
imap <silent> <C-e> <C-o>:call emmet#expandAbbr(3,"")<CR>
	" paste whole lines without the surrounding whitespace
nmap <silent> gp "=substitute(@@, '\(^[ \t]*\)\\|\n*', '', 'g')<CR>p
nmap <silent> gP "=substitute(@@, '\(^[ \t]*\)\\|\n*', '', 'g')<CR>P
vmap <silent> gp "=substitute(@1, '\(^[ \t]*\)\\|\n*', '', 'g')<CR>p
	" reveal highlight group under the cursor
nmap <leader>§ :echo synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")<CR>
	" copy into the terminal sequence buffer (copy in tmux)
nmap <leader>y <Plug>OSCYank
nmap <leader>Y V:OSCYank<CR>
vmap <leader>y :OSCYank<CR>
	" fzf
nmap <leader><Tab> :Buffers<CR>
nmap <leader>m :Marks<CR>
nmap <leader>f :Files<CR>
nmap <leader>F :GFiles<CR>
nmap <leader>ƒ :GFiles?<CR>
nmap <leader><Space> :Rg<space>
" nmap <leader><CR> :Rg <C-R><C-W><CR>
" nmap <leader>/ :History/<CR>
nmap <silent> <leader>nu :set invnumber<CR>
nmap <silent> <leader>\ :set invpaste<CR>
nmap <silent> U :redo<CR>
nmap <silent> Г :redo<CR>
vmap <silent> tt :s/\t/    /<CR>:noh<CR>
vmap <silent> TT :s/    /\t/<CR>:noh<CR>
nmap <silent> <Enter> :set invhlsearch<CR>
	" language server binds
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)
nmap <silent> g® <Plug>(coc-refactor)
nmap <silent> ff <Plug>(coc-format-selected)
vmap <silent> ff <Plug>(coc-format-selected)
nmap <silent> <leader>cocR :CocRestart<CR>
nmap <silent> <leader>cocc :CocCommand<CR>
nmap <silent> ]c :CocNext<CR>
nmap <silent> [c :CocPrev<CR>
nmap <silent> []q :call setqflist([])<CR>:cclose<CR>
nmap <silent> []l :call setloclist([])<CR>:lclose<CR>
	" hotkey terminal
nmap <silent> <leader>t :FloatermToggle<CR>
nmap <silent> <leader>T :FloatermNew<CR>
nmap <silent> ,. <Cmd>FloatermToggle<CR>
tmap <silent> ]t <Cmd>FloatermNext<CR>
tmap <silent> [t <Cmd>FloatermPrev<CR>
tmap <silent> ,, <C-\><C-n>
tmap <silent> ,. <Cmd>FloatermToggle<CR>
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
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

	" colour column
nmap <silent> <leader>cc :<C-u>execute 'setl cc=' . v:count<CR>
	" text width
nmap <silent> <leader>tw :<C-u>execute 'setl tw=' . v:count<CR>
	" shift width
nmap <silent> <leader>sw :<C-u>execute 'setl sw=' . v:count<CR>
	" tab stop
nmap <silent> <leader>ts :<C-u>execute 'setl ts=' . v:count<CR>
	" fold column
nmap <silent> <leader>cf :<C-u>execute 'setl foldcolumn=' . v:count<CR>
	" fold level
nmap <silent> <leader>lf :<C-u>execute 'setl foldlevel=' . v:count<CR>
	" status line (0-2)
nmap <silent> <leader>ls :<C-u>execute 'set laststatus=' . v:count<CR>

fun! Man(...)
	if &ft == 'elixir'
		Dash
		return
	en
	if &ft == 'go'
		GoDocBrowser
		return
	en
endf
	" external docs
nmap <silent> <leader>K :call Man()<CR>

let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.7 } }
let g:fzf_preview_window = ['right,70%,<70(up,50%)', 'ctrl-/']
let g:floaterm_title = ''
	" go
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0
	" typescript
let g:prettier#quickfix_enabled = 1
let g:prettier#autoformat_require_pragma = 0
let g:svelte_indent_style = 0
let g:sleuth_play_heuristics = 0
	" copilot
inoremap <silent><script><expr> <PageUp> copilot#Previous()
inoremap <silent><script><expr> <PageDown> copilot#Next()
inoremap <silent><script><expr> <Home> copilot#Accept("\<CR>")
inoremap <silent><script><expr> <End> copilot#Dismiss()

imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")

let g:copilot_no_tab_map = v:true
let g:copilot_filetypes = {
	\ '*': v:false,
	\ 'python': v:true,
	\ 'go': v:true,
	\ 'elixir': v:true,
	\ 'javascript': v:true,
	\ 'typescript': v:true,
	\ 'vim': v:true,
	\ }

augroup oncevimrc
		" wipe the registers on close
	au BufUnload *.gpg Wipe
		" remove trailing spaces
	au BufWritePre * :%s/\s\+$//e
		" reload .vimrc on save
	"au FileType vim nmap <buffer> <leader>, :w<CR>:Rc<CR>
	au FileType c,cpp,java setl commentstring=//\ %s
	au FileType sql setl commentstring=--\ %s
		" tab policy
	au FileType svelte,typescript,javascript setl sw=2 ts=2 noet
	au FileType vim,python setl sw=2 ts=2
	au FileType go,html,markdown setl sw=4 ts=4 noet
	au FileType sql  setl et
		" playfount
	au FileType play setl noet sw=8 ts=16 tw=80
	au FileType play imap <silent> ,, <esc>m0gqip`0a
	au FileType play imap <ForceClick> <C-o>vip
	au FileType play nmap <ForceClick> vip
	au FileType play CocDisable
	au FileType play au BufNew,BufEnter <buffer> CocDisable
augroup END

augroup gpt_binds
	au FileType gpt nnoremap <buffer><silent> <Home> <Cmd>GptDefault<CR>
	au FileType gpt nnoremap <buffer><silent> <End> <Cmd>GptDialog<CR>
	au FileType gpt imap <buffer><silent> <Home> <Esc><Home>
	au FileType gpt imap <buffer><silent> <End> <Esc><End>
	au FileType gpt nmap <buffer><silent> <leader>p <Home>
	au FileType gpt nmap <buffer><silent> <leader>P <End>
augroup END

let g:markdown_fenced_languages = [
		\ 'go',
		\ 'python',
		\ 'javascript',
		\ 'typescript',
		\ 'sql',
		\ 'cpp',
		\ 'elixir',
		\ 'vim' ]
let g:gpt_default_register = 'p'
let g:gpt_default_model = '4'
let g:gpt_default_opts = '0'
nnoremap <leader><leader> <Cmd>Gpt<CR>
inoremap <leader><leader> <Esc>:Gpt<CR>

nnoremap <S-Up> <Cmd>leftabove sp<CR>
nnoremap <S-Down> <Cmd>sp<CR>
nnoremap <S-Left> <Cmd>leftabove vsp<CR>
nnoremap <S-Right> <Cmd>vsp<CR>
inoremap <S-Up> <Esc>:leftabove sp<CR>
inoremap <S-Down> <Esc>:sp<CR>
inoremap <S-Left> <Esc>:leftabove vsp<CR>
inoremap <S-Right> <Esc>:vsp<CR>
