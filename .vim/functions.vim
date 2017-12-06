function! SwapUp()
   if line(".") == 1
       return
   endif
   call feedkeys("ddkP")
endfunction

function! SwapDown()
   if line(".") == line("$")
       return
   endif
   call feedkeys("ddp")
endfunction
