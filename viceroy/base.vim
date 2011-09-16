set nocompatible            " Be iMproved

" Pick a decent default colorscheme
colorscheme slate

" Hook in bundle settings, before we load the bundles
runtime! viceroy/bundle-settings.vim

" Hook in pathogen
if filereadable(expand('~/.vim/bundle/vim-pathogen/autoload/pathogen.vim'))
  source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
  call pathogen#infect()
endif

" Hook in the local vimrc
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" vim:set ft=vim et tw=78 sw=2 encoding=utf-8
