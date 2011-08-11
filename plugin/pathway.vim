" Pathway.vim
"
" Plugin loader for pathogen.vim
"
"
"if exists('g:loaded_pathway') || &cp
"  finish
"endif
"let g:loaded_rename = 1

" TODO: see if there is a way to get this from pathogen
if !exists('g:bundle_dir')
  let g:bundle_dir =  expand('$HOME/.vim/bundle')
endif

function! s:trim(str)
  return substitute(a:str,"^\\s\\+\\|\\s\\+$","","g")
endfunction

function! s:parse_line(arg)
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

  let path = g:bundle_dir . "/" . name
  return {'name': name, 'uri': uri, 'path':path }
endfunction


function! s:readbundlefile()
  let bundles = []
  if filereadable(expand('~/.vim/Bundlefile'))
    for line in readfile(expand('~/.vim/Bundlefile'))

      let line = s:trim(line)

      " Skip comments and blank lines
      if line !~ "^$" && line !~ "^\s*#.*$"
        call add(bundles, s:parse_line(line))
      endif
    endfor
  endif
  return bundles
endfunction

function! s:sync(bang, bundle) abort
  if isdirectory(expand(a:bundle.path.'/.git/'))
    if !(a:bang) | return [0, 'skip'] | endif
    let cmd = 'cd '.shellescape(a:bundle.path).' && git pull'

    if (has('win32') || has('win64'))
      let cmd = substitute(cmd, '^cd ','cd /d ','')  " add /d switch to change drives
      let cmd = '"'.cmd.'"'                          " enclose in quotes
    endif
  else
    let cmd = 'git clone '.a:bundle.uri.' '.shellescape(a:bundle.path)
  endif

  silent exec '!'.cmd

  if 0 != v:shell_error
    echohl Error | echo 'Error installing "'.a:bundle.name.'". Failed cmd: '.cmd | echohl None
    return [v:shell_error, 'error']
  end
  return [0, 'ok']
endfunction

function! s:install(bang, bundles) abort
  let [installed, errors] = [[],[]]

  for bundle in a:bundles
    echo "hi"
    let [err_code, status] = s:sync(a:bang, bundle)
    if 0 == err_code
      if 'ok' == status | call add(installed, bundle) | endif
    else
      call add(errors, bundle)
    endif
  endfor
  return [installed, errors]
endfunction

function! pathway#install(bang, ...) abort
  if !isdirectory(g:bundle_dir) | call mkdir(g:bundle_dir, 'p') | endif
  let bundles = s:readbundlefile()

  let [installed, errors] = s:install(a:bang, bundles)
  if empty(errors) | redraw! | end
  " TODO: handle error: let user know hen they need to restart Vim
  "call vundle#config#require(bundles)

  let msg = 'No new bundles were installed'
  if (!empty(installed))
    let msg = "Installed bundles:\n".join(map(installed, 'v:val.name'),"\n")
  endif
  echo msg

endfunction




com! -nargs=1 Bundle call s:bundle(<args>)

" Commands
com! -nargs=? -bang BundleInstall
\ call pathway#install('!' == '<bang>', <q-args>)


" TODO:
"
" Create a list of no-bundles from user's Bundlefile, and make sure to
" exclude files from that list
"
" Actually git clone things
"
" allow options to git (branch, ref, shallow clone)

"  " Load the bundles
"  if filereadable(expand('~/.vimrc.bundle'))
"    source ~/.vimrc.bundle
"  elseif filereadable(expand('~/.vim/viceroy/bundles.vim'))
"    source ~/.vim/viceroy/bundles.vim
"  endif

