" Pathway.vim
"
" Plugin loader for pathogen.vim
"
"
if exists('g:loaded_pathway') || &cp
  finish
endif
let g:loaded_rename = 1

if filereadable(expand('~/.vim/autoload/pathogen.vim'))

  function s:trim(str)
    return substitute(a:str,"^\\s\\+\\|\\s\\+$","","g")
  endfunction

  function s:parse_name(arg)
    let arg = a:arg
    if    arg =~? '^\s*\(gh\|github\):\S\+'
          \  || arg =~? '^[a-z0-9][a-z0-9-]*/[^/]\+$'
      let uri = 'https://github.com/'.split(arg, ':')[-1]
      let name = substitute(split(uri,'\/')[-1], '\.git\s*$','','i')
    elseif arg =~? '^\s*\(git@\|git://\)\S\+'
          \   || arg =~? '\(file\|https\?\)://'
          \   || arg =~? '\.git\s*$'
      let uri = arg
      let name = split( substitute(uri,'/\?\.git\s*$','','i') ,'\/')[-1]
    else
      let name = arg
      let uri  = 'https://github.com/vim-scripts/'.name.'.git'
    endif
    return {'name': name, 'uri': uri }
  endfunction


  function pathway#readbundlefile()
    if !exists('g:bundles') | let g:bundles = [] | endif
    if filereadable(expand('~/.vim/Bundlefile'))
      for line in readfile(expand('~/.vim/Bundlefile'))

        let line = s:trim(line)

        " Skip comments and blank lines
        if line !~ "^$" && line !~ "^\s*#.*$"
          "call add(g:bundles,s:parse_name(line))
          call add(g:bundles,line)
        endif
      endfor
    endif
  endfunction

  function pathway#install()
    call pathway#readbundlefile()
    for line in g:bundles
      let bundle = s:parse_name(line)
      let uri = bundle.name
      echo "git clone " . bundle.uri . " " . expand("~/.vim/test") . "/" . bundle.name
    endfor
  endfunction

  if !exists('g:bundles') | let g:bundles = [] | endif
  func! s:bundle(arg)
    let bundle = a:arg
    call add(g:bundles,s:parse_name(bundle))
  endf
  com! -nargs=1 Bundle call s:bundle(<args>)

" Commands
  command! -nargs=0 BundleInstall call pathway#install()



"  " Load the bundles
"  if filereadable(expand('~/.vimrc.bundle'))
"    source ~/.vimrc.bundle
"  elseif filereadable(expand('~/.vim/viceroy/bundles.vim'))
"    source ~/.vim/viceroy/bundles.vim
"  endif

else
  echo "Pathogen is not installed"

  "Monkey patch the Bundle command, this makes :Bundle a no-op.
"  command! -nargs=+ Bundle
"
"  echo "Run :BundleInstall to install plugins"
"  "Only define bundle init if vundle is not loaded
"  function s:bundle_init()
"    silent exec "!git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
"    " Reload everything since we just added Vundle
"    if filereadable($MYVIMRC)| silent source $MYVIMRC | endif
"    call s:load_vundle()
"    call vundle#installer#install('', '')
"  endfunction
"  command! BundleInstall :call s:bundle_init()
endif
