set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

if filereadable(expand('~/.vim/Bundlefile'))
  source ~/.vim/Bundlefile
endif

filetype plugin indent on     " required!
