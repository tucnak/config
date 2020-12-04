set lines=50 columns=70
set guifont=Roboto\ Mono:h13
set printfont=Roboto\ Mono:h13
colorscheme plan9

nmap \ :Goyo<CR>
fun! PlayfountStyle()
	hi todo gui=bold
	hi playfountParenthetical guifg=gray36
	hi playfountTitle	gui=bold guifg=darkgreen
	hi playfountNotes	gui=italic guifg=darkblue
	hi playfountScene	gui=bold,underline guifg=firebrick
	hi playfountCentered gui=bold,italic,underline
endfun
call PlayfountStyle()
au! User GoyoLeave nested call PlayfountStyle()

fun! PlayfountStatus()
	let l:status = v:statusmsg
    try
        exe "silent normal! g\<C-g>"
        echo printf('%s, %.0fmin readtime',
                    \ v:statusmsg, ceil(wordcount()['words'] / 200.0))
    finally
        let v:statusmsg = l:status
    endtry
endfun

" messes with omnicomplete
au FileType playft imap <silent> <Up> <Esc>gka
au FileType playft imap <silent> <Down> <Esc>gja
au FileType playft set lines=50 columns=70
au FileType playft set laststatus=0
au FileType playft set guifont=Roboto\ Mono:h15
