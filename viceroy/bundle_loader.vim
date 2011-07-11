if isdirectory(expand("~/.vim/bundle/vundle"))
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  au BufNewFile,BufRead Bundlefile set filetype=vim

  " let Vundle manage Vundle
  Bundle 'gmarik/vundle'
else

  "Monkey patch the Bundle command
  com! -nargs=+ Bundle echo <args>

  echo "Run :BundleInit to install plugins"
  "Only define bundle init if vundle is not loaded
  function s:bundle_init()
    silent exec "!git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
    :call s:load_vundle()
    BundleInstall
  endfunction
  command! BundleInit :call s:bundle_init()
endif
