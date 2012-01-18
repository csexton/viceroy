""" Mappings
if !exists('g:viceroy_dont_remap_leader')
  let mapleader = ","
endif
nnoremap          j gj
nnoremap          k gk
nnoremap          Y y$
nnoremap <silent> <C-L> :nohls<CR><C-L>
inoremap          <C-C> <Esc>`^
cnoremap          <C-O> <Up>
inoremap          ø <C-O>o
inoremap          <M-o> <C-O>o
inoremap          <C-X><C-@> <C-A>

" Sacrilege: emacs like bindings in command and insert
inoremap          <C-A> <C-O>^
cnoremap          <C-A> <Home>
cnoremap          <C-X><C-A> <C-A>
cnoremap          <C-P> <Up>
cnoremap          <C-N> <Down>
inoremap          <C-k> <C-O>D
cnoremap          <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>

" Inserts the path of the currently edited file into a command
"cmap <C-F> <C-R>=expand("%:p:h") . "/" <CR>

" If at end of a line of spaces, delete back to the previous line. Otherwise, <Left>
inoremap <silent> <C-B> <C-R>=getline('.')=~'^\s*$'&&col('.')>strlen(getline('.'))?"0\<Lt>C-D>\<Lt>Esc>kJs":"\<Lt>Left>"<CR>
cnoremap          <C-B> <Left>

" If at end of line, decrease indent, else <Del>
inoremap <silent> <C-D> <C-R>=col('.')>strlen(getline('.'))?"\<Lt>C-D>":"\<Lt>Del>"<CR>
cnoremap          <C-D> <Del>

" If at end of line, fix indent, else <Right>
inoremap <silent> <C-F> <C-R>=col('.')>strlen(getline('.'))?"\<Lt>C-F>":"\<Lt>Right>"<CR>
cnoremap          <C-F> <Right>

" Map Control-E to go to the end of the line in insert mode. However, when
" completion is active you can use CTRL-E to stop it and go back to the
" originally typed text.
inoremap          <C-E> <C-R>=InsCtrlE()<CR>
function! InsCtrlE()
    try
        norm! i
        return "\<c-o>A"
    catch
        return "\<c-e>"
    endtry
endfunction


" Enable TAB indent and SHIFT-TAB unindent
vnoremap <silent> <TAB> >gv
vnoremap <silent> <S-TAB> <gv

" Keep selection when indenting in visual mode
"vnoremap <silent> >> >gv
"vnoremap <silent> << <gv

" Toggle line wrapping
map <Leader>w  :set nowrap!<CR>

" Toggle line numbers
map <Leader>l  :set nonumber!<CR>

" Browse the directory of the current file
"map <Leader>b  :edit %:h<CR>

if !exists('g:bundle_dir') | let g:bundle_dir =  expand('$HOME/.vim/bundle') | endif
if isdirectory(g:bundle_dir)
  let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
  " Toggle the project Drawer
  map <Leader>d :NERDTreeToggle<CR>
  map <D-d> :NERDTreeToggle<CR>

  map <Leader>e  :BufExplorer<CR>
  nnoremap <D-e> :BufExplorer<CR>

  map <Leader>g  :GundoToggle<CR>
  map <D-g>  :GundoToggle<CR>
  command! Gundo :GundoToggle

  map <Leader>t :CommandT<CR>
  nnoremap <silent> <Leader>y :YRShow<CR>
  nnoremap <silent> <D-y> :YRShow<CR>
endif

