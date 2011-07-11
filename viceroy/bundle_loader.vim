if isdirectory(expand("~/.vim/bundle/vundle"))
  set nocompatible               " be iMproved
  filetype off                   " required!

  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  " let Vundle manage Vundle
  Bundle 'gmarik/vundle'

  " Load the bundles
  if filereadable(expand('~/.vimrc.bundle'))
    source ~/.vimrc.bundle
  elseif filereadable(expand('~/.vim/viceroy/bundles.vim'))
    source ~/.vim/viceroy/bundles.vim
  endif

  filetype plugin indent on     " required for vundle
else

  "Monkey patch the Bundle command, this makes :Bundle a no-op.
  com! -nargs=+ Bundle

  echo "Run :BundleInit to install plugins"
  "Only define bundle init if vundle is not loaded
  function s:bundle_init()
    silent exec "!git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
    " Reload everything since we just added Vundle
    if filereadable($MYVIMRC)| silent source $MYVIMRC | endif
    :call s:load_vundle()
    BundleInstall
  endfunction
  command! BundleInit :call s:bundle_init()
endif
