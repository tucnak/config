set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
source ~/.gvimrc

noremap <D-s> <Cmd>w<Cr>
noremap <D-z> <Cmd>undo<Cr>
noremap <D-c> "*y<Cr>
noremap <D-v> "*p<Cr>
noremap <D-x> "*d<Cr>
noremap <D-a> ggVG

inoremap <D-s> <Cmd>w<Cr>
inoremap <D-z> <Cmd>undo<Cr>
inoremap <D-v> <Esc>"*p<Cr>a
nnoremap u <Cmd>undo<Cr>

" noremap <ScrollWheelDown> <ScrollWheelUp>
" noremap <ScrollWheel> <ScrollWheelUp>
