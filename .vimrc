	" TODO: do not forget to update accordingly
set shell=/opt/homebrew/bin/fish

syntax enable
packadd matchit
filetype plugin indent on
colorscheme default

set autoindent
set colorcolumn=0
set completeopt=longest,noinsert,menuone,noselect
set exrc
set fileencoding=utf8
set fillchars=vert:\ ,fold:-,foldopen:-,foldclose:+,diff:-
set foldcolumn=5
set foldlevel=5
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
set showbreak=....
set showmatch
set smartcase
set smartindent
set smarttab
set splitbelow
set splitright
set t_Co=256
set termguicolors
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
au BufUnload *.gpg Wipe

	" load .vimrc and .gvimrc
command! Rc source ~/.vimrc | source ~/.gvimrc

call plug#begin()
	" foundation
Plug 'jamessan/vim-gnupg'
Plug 'ojroques/vim-oscyank'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" language servervs
Plug 'josa42/coc-go'
Plug 'neoclide/coc-tsserver'
Plug 'coc-extensions/coc-svelte'
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

	" not language servers
Plug 'fatih/vim-go'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'elixir-editors/vim-elixir'

	" we. like. tpope
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-dadbod'
	" i used to have 'tpope/vim-commentary' but as of now
	" wish to consider better mixed
	" filetype support
Plug 'tomtom/tcomment_vim'
Plug 'wellle/targets.vim'
Plug 'justinmk/vim-sneak'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'voldikss/vim-floaterm'
Plug 'mattn/emmet-vim'
Plug 'jessfraz/openai.vim'

"Plug 'hut:badt/vim-banderol'
Plug 'tucnak/vim-playfount'
call plug#end()

	" in terminal i want blue, in gui- i want yellow
hi Normal guibg=#f0f7ff
hi Comment guifg=darkgray
hi Identifier guifg=black
hi Constant term=italic gui=italic
hi Type term=bold
hi Statement term=bold
	" floats don't look good... why? who knows
hi CocFadeOut guibg=lightred ctermbg=red
hi FgCocInfoSignBgCocFloating ctermfg=9 ctermbg=13 guifg=#15aabf guibg=LightMagenta
hi FgCocErrorSignBgCocFloating ctermfg=9 ctermbg=13 guifg=white guibg=LightMagenta
hi FgCocWarningSignBgCocFloating ctermfg=9 ctermbg=13 guifg=#15aabf guibg=LightMagenta
hi clear Folded
hi clear FoldColumn
hi clear SignColumn
	" reveal highlight group under the cursor
nmap <leader>§ :echo synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")<CR>

	" floating autocomplete pop
fun! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endf
" inoremap <silent><expr> <TAB>
" 	\ coc#pum#visible() ? coc#pum#next(1):
" 	\ CheckBackspace() ? "\<Tab>" :
" 	\ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

	" universally good looking fold labels
fun! Foldtext()
	let head = substitute(getline(v:foldstart), "^[\t ]*", "", 1)
	let prefix = repeat(' ', indent(v:foldstart))
	return prefix . head
endf
set foldtext=Foldtext()

	" print word count, approx. read time
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
nmap <silent> <leader>wc :call Readtime()<CR>

	" who doesn't like a comma?
nmap <leader>v :vert<Space>
nmap <leader>, :w<CR>
imap <leader>, <Cmd>:w<CR>
nmap <silent> ZX :bp<bar>sp<bar>bn<bar>bw!<CR>
nmap <silent> gx yiW:!open <cWORD><CR> <C-r>" & <CR><CR>
nmap <silent> <TAB> <C-i>
nmap <silent> <S-TAB> <C-o>
imap <silent> <C-e> <C-o>:call emmet#expandAbbr(3,"")<CR>
	" paste whole lines without the surrounding whitespace
nmap <silent> gp "=substitute(@@, '\(^[ \t]*\)\\|\n*', '', 'g')<CR>p
nmap <silent> gP "=substitute(@@, '\(^[ \t]*\)\\|\n*', '', 'g')<CR>P
vmap <silent> gp "=substitute(@1, '\(^[ \t]*\)\\|\n*', '', 'g')<CR>p

let mapleader = ","
nmap <silent> <leader>cc :<C-u>execute 'setl cc=' . v:count<CR>
nmap <silent> <leader>tw :<C-u>execute 'setl tw=' . v:count<CR>
	" copy into the terminal sequence buffer (copy in tmux)
nmap <leader>y <Plug>OSCYank
nmap <leader>Y V:OSCYank<CR>
vmap <leader>y :OSCYank<CR>
	" fzf
nmap <leader><TAB> :Buffers<CR>
nmap <leader>m :Marks<CR>
nmap <leader>f :Files<CR>
nmap <leader>F :GFiles<CR>
nmap <leader><Space> :Rg<space>
nmap <leader>/ :History/<CR>
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
nmap <silent> ]c :CocNext<CR>
nmap <silent> [c :CocPrev<CR>
nmap <silent> <leader>cocR :CocRestart<CR>
nmap <silent> <leader>cocc :CocCommand<CR>
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

let g:floaterm_title = ''
	" vim-go overrides
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0
	" typescript formatting
let g:prettier#quickfix_enabled = 1
let g:prettier#autoformat_require_pragma = 0
let g:svelte_indent_style = 0
let g:sleuth_play_heuristics = 0

	" remove trailing spaces
au BufWritePre * :%s/\s\+$//e
	" reload .vimrc on save
au FileType vim nmap <buffer> <leader>, :w<CR>:Rc<CR>
au FileType c,cpp,java setl commentstring=//\ %s
au FileType sql setl commentstring=--\ %s
	" tab policy
au FileType svelte,typescript,javascript setl sw=2 ts=2 noet
au FileType vim,python setl sw=2 ts=2
au FileType go,html,markdown setl sw=4 ts=4 noet
au FileType sql  setl et
au FileType play setl noet sw=8 ts=16 tw=80
au FileType play imap ,, <C-o>gqip
au FileType play imap <ForceClick> <C-o>vip
au FileType play nmap <ForceClick> vip
au FileType play CocDisable
au FileType play au BufNew,BufEnter <buffer> CocDisable
