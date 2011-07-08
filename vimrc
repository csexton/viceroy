set nocompatible
if filereadable(expand('~/.vim/settings/base.vim'))
  source ~/.vim/settings/base.vim
endif
" Command-T settings need to be loaded before plugins are
let g:CommandTMaxHeight=20

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

autocmd GuiEnter * set guifont=Anonymous\ Pro:h16,Monaco:h16
