if exists('g:loaded_viceroy_update') || &cp
  finish
endif
let g:loaded_viceroy_update = 1


" Update Viceroy system, sync it to the origin repo it was originally cloned
" from
function! viceroy#update()
  exec "!cd ~/.vim && git pull origin"
endfunction
command! ViceroyUpdate :call viceroy#update()

