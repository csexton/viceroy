if has("gui_macvim")

  " Disable Command-W
  macmenu File.Close key=<nop>

  " Remap Command-T for CommandT
  if exists("g:command_t_loaded")
    macmenu &File.New\ Tab key=<D-S-t>
    map <D-t> :CommandT<CR>
  endif

  if version > 702
    " Switch buffers instead of tabs
    macmenu Window.Select\ Next\ Tab key=<nop>
    macmenu Window.Select\ Previous\ Tab key=<nop>
    map <D-{> :bp<CR>
    map <D-}> :bn<CR>
  endif
endif
