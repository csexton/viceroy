""" Mappings
let mapleader = ","
nnoremap          j gj
nnoremap          k gk
map               Y y$
nnoremap <silent> <C-L> :nohls<CR><C-L>
inoremap          <C-C> <Esc>`^
cnoremap          <C-O> <Up>
inoremap          ø <C-O>o
inoremap          <M-o> <C-O>o
inoremap          <C-X><C-@> <C-A>
inoremap          <C-A> <C-O>^
cnoremap          <C-A> <Home>
cnoremap          <C-X><C-A> <C-A>
inoremap          <C-k> <C-O>D
cnoremap          <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
" If at end of a line of spaces, delete back to the previous line. Otherwise, <Left>
inoremap <silent> <C-B> <C-R>=getline('.')=~'^\s*$'&&col('.')>strlen(getline('.'))?"0\<Lt>C-D>\<Lt>Esc>kJs":"\<Lt>Left>"<CR>
cnoremap          <C-B> <Left>
" If at end of line, decrease indent, else <Del>
inoremap <silent> <C-D> <C-R>=col('.')>strlen(getline('.'))?"\<Lt>C-D>":"\<Lt>Del>"<CR>
cnoremap          <C-D> <Del>
" If at end of line, fix indent, else <Right>
inoremap <silent> <C-F> <C-R>=col('.')>strlen(getline('.'))?"\<Lt>C-F>":"\<Lt>Right>"<CR>
inoremap          <C-E> <End>
cnoremap          <C-F> <Right>

" Enable TAB indent and SHIFT-TAB unindent
vnoremap <silent> <TAB> >gv
vnoremap <silent> <S-TAB> <gv
"vnoremap <silent> >> >gv
"vnoremap <silent> << <gv

nmap \\           <Plug>NERDCommenterInvert
xmap \\           <Plug>NERDCommenterInvert

let g:jekyll_path = "/Users/csexton/src/codeography.com"
map <Leader>jn  :JekyllPost<CR>
map <Leader>jl  :JekyllList<CR>


map <Leader>w  :set nowrap!<CR>
map <Leader>l  :set nonumber!<CR>

map <Leader>e  :BufExplorer<CR>
nnoremap <D-e> :BufExplorer<CR>

map <Leader>n  :NERDTreeToggle<CR>
map <Leader>g  :GundoToggle<CR>
command! Gundo :GundoToggle

map <Leader>b  :edit %:h<CR>

"runtime! autoload/pathogen.vim
"if exists('g:loaded_pathogen')
"  call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundle'))
"endif


