colorscheme plan9

set lines=40 columns=82
set guifont=Roboto\ Mono:h13
set printfont=Roboto\ Mono:h13

nmap \ :Goyo<CR>
fun! s:playfount_style()
	hi playfountParenthetical guifg=gray36
	hi todo gui=bold

	hi playfountCharacter	gui=bold
	hi playfountCentered 	gui=bold,italic,underline
	hi playfountTitle	 	gui=bold guifg=darkgreen
	hi playfountNotes	 	gui=italic guifg=darkblue
	hi playfountScene	 	gui=bold,underline guifg=firebrick
	hi playfountItalic 	 	gui=italic
	hi playfountBold	 	gui=bold
endfun
call s:playfount_style()
au! User GoyoLeave nested call s:playfount_style()

" messes with omnicomplete
au FileType playft imap <silent> <Up> <Esc>gka
au FileType playft imap <silent> <Down> <Esc>gja
au FileType playft set lines=50 columns=127
au FileType playft set laststatus=0
au FileType playft set guifont=Roboto\ Mono:h15

au BufWritePre *.play :%s/"\(.*\)"/“\1”/e " fancy quotes
au BufWritePre *.play :%s/\.  /. /e " cutting double spaces
