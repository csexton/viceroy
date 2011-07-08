if (exists("g:loaded_vundle_helper") && g:loaded_vundle_helper) || &cp
    finish
endif
let g:loaded_vundle_helper= 1

function s:load_vundle()
  set nocompatible               " be iMproved
  filetype off                   " required!
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  au BufNewFile,BufRead Bundlefile set filetype=vim

  " let Vundle manage Vundle
  Bundle 'gmarik/vundle'

  if filereadable(expand('~/.vim/Bundlefile'))
    source ~/.vim/Bundlefile
  endif

  filetype plugin indent on     " required!
endfunction

if isdirectory(expand("~/.vim/bundle/vundle"))
  :call s:load_vundle()
else
  echo "Run :BundleInit to install plugins"
  "Only define bundle init if vundle is not loaded
  function s:bundle_init()
    silent exec "!git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
    :call s:load_vundle()
    BundleInstall
  endfunction
  command! BundleInit :call s:bundle_init()
endif