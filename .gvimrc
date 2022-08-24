hi Normal guibg=#ffffeb
hi Constant guifg=darkgreen gui=italic

	" macvim keyboard i18n support
set langmap=
set noimd
set imi=2
set imsearch=2

	" macvim touch pad binds for quickfix and jumplist
nmap <SwipeUp> :cnext<CR>
nmap <SwipeDown> :cprev<CR>
nmap <SwipeLeft> <C-o>
nmap <SwipeRight> <C-i>
"nmap <ForceClick> <Plug>(coc-definition)
nmap <ForceClick> K
imap <ForceClick> K

	" gui overrides
set ruler
set guifont=Roboto\ Mono:h14
set linebreak
set noshowmode
set laststatus=0

	" common windows size configurations
nmap <leader>`1 :set lines=20 columns=86<CR>
nmap <leader>`2 :set lines=50 columns=86<CR>
nmap <leader>`3 :set lines=50 columns=172<CR>
