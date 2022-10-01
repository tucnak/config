set termguicolors
hi clear VertSplit
hi Normal guibg=#ffffeb
hi Constant guifg=darkgreen gui=italic
hi ColorColumn guibg=#fafae1
hi Comment guifg=purple
hi StatusLine guibg=#ffffff guifg=Brown
hi StatusLineNC guibg=#ffffff guifg=Brown

set guifont=Fira\ Code:h12
	" change font on demand
nmap <silent> <leader>pt :<C-u>execute 'set guifont=Fira\ Code:h' . v:count<CR>
	" macvim keyboard i18n support
set langmap=
set noimd
set imsearch=2
	" remove scroll bars
set guioptions=egmTk
	" else
set ruler
set linebreak
set noshowmode
set nosplitscroll
set laststatus=0

	" karabiner binds these to back/forth mouse buttons
nmap <F1> <C-o>
nmap <F2> <C-i>
	" macvim touch pad binds for quickfix and jumplist
nmap <silent> <SwipeUp> :cnext<CR>
nmap <silent> <SwipeDown> :cprev<CR>
nmap <silent> <SwipeLeft> <C-o>
nmap <silent> <SwipeRight> <C-i>
nmap <silent> <ForceClick> :call Man()<CR>
imap <silent> <ForceClick> <Cmd>:call Man()<CR>

	" call Scale(lines, columns per split, #. of splits)
fun! Scale(...)
	let height = a:1
	let width = a:2
	" k is the number of splits
	let k = 1
	if a:0 > 2
		let k = a:3
	endif
	let &lines = height + 2
	" split lines are k-1 total, the sign columns are 2*k
	let &columns = k-1 + k*(&foldcolumn + width + 2)
endf
nmap <leader>1 :call Scale(20, 80)<CR>
nmap <leader>2 :call Scale(50, 80)<CR>
nmap <leader>3 :call Scale(20, 80, 2)<CR>
nmap <leader>4 :call Scale(50, 80, 2)<CR>
nmap <leader>5 :call Scale(50, 60, 3)<CR>
nmap <leader>6 :call Scale(80, 60, 3)<CR>
