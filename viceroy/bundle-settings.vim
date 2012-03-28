"
" This file is loaded before the bundles and plugins, to allow customizations
"
if exists('g:loaded_bundle_settings') || &cp
  finish
endif
let g:loaded_bundle_settings = 1

" Command-T settings need to be loaded before plugins are
let g:CommandTMaxHeight=20       " limit to 20 lines0

let g:is_bash = 1                " Highlight all .sh files as if they were bash
let g:ruby_minlines = 500
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDShutUp = 1
let g:VCSCommandDisableMappings = 1

let g:bufExplorerShowRelativePath=1
if has('mac')
  let g:gist_clip_command = 'pbcopy'
endif

let g:surround_{char2nr('s')} = " \r"
let g:surround_{char2nr(':')} = ":\r"
let g:surround_indent = 1

let g:solarized_visibility="low"     " Let trailer trash handle whitespace

let vimclojure#HighlightBuiltins = 1 " Highlight Clojure builtins
let vimclojure#ParenRainbow = 1      " Rainbow parentheses

let g:yankring_history_file = '.vim-yankring-history'
