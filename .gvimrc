colorscheme plan9

"set lines=40 columns=82
set nonu
set guifont=Roboto\ Mono:h15
set printfont=Roboto\ Mono:h15
set linebreak
set noshowmode
set laststatus=0

nmap <silent> \ :Goyo<CR>
nmap <silent> \| :setlocal invnumber<CR>
fun! s:playfount_style()
	hi todo gui=bold
	hi playfountCharacter   gui=bold
	hi playfountCentered 	gui=bold,italic,underline
	hi playfountTitle	 	gui=bold guifg=darkgreen
	hi playfountNotes	 	gui=italic guifg=darkblue
	hi playfountScene	 	gui=bold,underline guifg=firebrick
	hi playfountItalic 	 	gui=italic
	hi playfountBold	 	gui=bold

	hi playfountParenthetical guifg=gray36
endfun
call s:playfount_style()
au! User GoyoLeave nested call s:playfount_style()

" messes with omni complete
au FileType playft imap <silent> <Up> <Esc>gka
au FileType playft imap <silent> <Down> <Esc>gja
au BufWritePre *.play :%s/"\(.*\)"/“\1”/e " fancy quotes
au BufWritePre *.play :%s/\.  /. /e " cutting double spaces
