hi Normal guibg=#ffffeb
hi Constant guifg=darkgreen gui=italic
hi ColorColumn guibg=#ffffff

	" macvim keyboard i18n support
set langmap=
set noimd
set imsearch=2
	" remove scroll bars
set guioptions=egm
set ruler
set guifont=Menlo:h16
set linebreak
set noshowmode
set laststatus=0

	" macvim touch pad binds for quickfix and jumplist
nmap <SwipeUp> :cnext<CR>
nmap <SwipeDown> :cprev<CR>
nmap <SwipeLeft> <C-o>
nmap <SwipeRight> <C-i>
"nmap <ForceClick> <Plug>(coc-definition)
nmap <ForceClick> K
imap <ForceClick> <C-o>K

	" common windows size configurations
nmap <leader>`1 :set lines=20 columns=86<CR>
nmap <leader>`2 :set lines=50 columns=86<CR>
nmap <leader>`3 :set lines=50 columns=172<CR>
nmap <leader>`4 :set lines=95 columns=86<CR>
