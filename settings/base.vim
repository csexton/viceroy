syntax on
filetype plugin indent on
set autoindent
set autoread
set autowrite       " Automatically save before commands like :next and :make
set backspace=indent,eol,start
""set backup          " Do keep a backup file
set backupskip+=*.tmp,crontab.*
set cmdheight=1
set complete-=i     " Searching includes can be slow
set dictionary+=/usr/share/dict/words
set display=lastline " When lines are cropped at the screen bottom, show as much as possible
set expandtab
set nofoldenable
set gdefault        " When on, the ":substitute" flag 'g' is default on.
set guioptions=cg   " Get rid of the scrollbar and toolbar
set hidden          " Allow dirty unsaved buffers
set history=1000    " Remember more history
set hlsearch        " Highlight searches
set ignorecase      " Ignore case in searches.
set incsearch       " Incremental search
set joinspaces
set laststatus=2    " Always show status line
set list            " show trailing whiteshace and tabs
"set listchars=tab:▸\ ,trail:-,extends:>,precedes:<,nbsp:+    " ,eol:¬
set listchars=tab:»\ ,trail:·,extends:→,precedes:←,nbsp:‗
set modelines=5     " Debian likes to disable this
set mousemodel=popup
set pastetoggle=<F2>
"set relativenumber
set scrolloff=1     " Minimal number of screen lines to keep above and below the cursor.
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set sidescrolloff=5
set smartcase       " Case insensitive searches become sensitive with capitals
set smarttab        " sw at the start of the line, sts everywhere else
set spelllang=en_us
set suffixes+=.dvi  " Lower priority in wildcards
set tags+=../tags,../../tags,../../../tags,../../../../tags
set timeoutlen=1200 " A little bit more time for macros
set ttimeoutlen=50  " Make Esc work faster
set virtualedit=block
set visualbell
set wildignore+=*~
set wildmenu
set wildmode=longest:full,full
set winaltkeys=no

if has("gui_running")
  set showbreak=⤥
  set background=dark
endif

function! HTry(function, ...)
  if exists('*'.a:function)
    return call(a:function, a:000)
  else
    return ''
  endif
endfunction

if &grepprg ==# 'grep -n $* /dev/null'
  set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude='*.log'\ --exclude=tags\ $*\ /dev/null
endif
if &statusline == ''
  set statusline=[%n]\ %<%.99f\ %h%w%m%r%{HTry('CapsLockStatusline')}%y%{HTry('rails#statusline')}%{HTry('fugitive#statusline')}%{HTry('rvm#statusline')}%#ErrorMsg#%{HTry('SyntasticStatuslineFlag')}%*%=%-14.(%l,%c%V%)\ %P
endif

if $TERM == '^\%(screen\|xterm-color\)$' && t_Co == 8
  set t_Co=16
endif

command! -bar -nargs=0 SudoW   :setl nomod|silent exe 'write !sudo tee % >/dev/null'|let &mod = v:shell_error
command! -bar -nargs=* -bang W :write<bang> <args>

"runtime! plugin/matchit.vim
runtime! macros/matchit.vim

iabbrev Lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

augroup settings
  autocmd!

  " Restore cursor position
  autocmd BufReadPost *.rb if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" | endif


  autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
        \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif

  autocmd BufNewFile,BufRead *.scss             set ft=scss.css
  "au BufRead,BufNewFile *.scss set filetype=scss.css
  autocmd BufNewFile,BufRead *.md               set ft=markdown
  autocmd BufNewFile,BufRead *.haml             set ft=haml
  autocmd BufNewFile,BufRead *.feature,*.story  set ft=cucumber
  autocmd BufRead * if ! did_filetype() && getline(1)." ".getline(2).
        \ " ".getline(3) =~? '<\%(!DOCTYPE \)\=html\>' | setf html | endif

  autocmd FileType javascript,coffee      setlocal et sw=2 sts=2 isk+=$
  autocmd FileType html,xhtml,css,scss    setlocal et sw=2 sts=2
  autocmd FileType eruby,yaml,ruby        setlocal et sw=2 sts=2
  autocmd FileType cucumber               setlocal et sw=2 sts=2
  autocmd FileType gitcommit              setlocal spell
  autocmd FileType ruby                   setlocal comments=:#\  tw=79
  autocmd FileType vim                    setlocal et sw=2 sts=2 keywordprg=:help

  autocmd Syntax   css  syn sync minlines=50

  "autocmd User Rails nnoremap <buffer> <D-r> :<C-U>Rake<CR>
  "autocmd User Rails nnoremap <buffer> <D-R> :<C-U>.Rake<CR>
  autocmd User Rails Rnavcommand uploader app/uploaders -suffix=_uploader.rb -default=model()
  autocmd User Rails Rnavcommand steps features/step_definitions -suffix=_steps.rb -default=web
  autocmd User Rails Rnavcommand blueprint spec/blueprints -suffix=_blueprint.rb -default=model()
  autocmd User Rails Rnavcommand factory spec/factories -suffix=_factory.rb -default=model()
  autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()
  autocmd User Rails Rnavcommand support spec/support features/support -default=env
  autocmd User Rails Rnavcommand sass app/sass -suffix=.scss -default=model()
  autocmd User Fugitive command! -bang -bar -buffer -nargs=* Gpr :Git<bang> pull --rebase <args>
augroup END

" colorscheme risto
"set background=dark
let g:solarized_visibility="low" " Let trailer trash handle whitespace
try
  colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme desert
endtry
autocmd GuiEnter * set guifont=Anonymous\ Pro:h16,Monaco:h16

" Command-T settings need to be loaded before plugins are
let g:CommandTMaxHeight=20

" vim:set ft=vim et tw=78 sw=2:
