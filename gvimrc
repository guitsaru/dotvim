if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle<CR>

  " Command-][ to increase/decrease indentation
  vmap <D-]> >gv
  vmap <D-[> <gv
endif

set guifont=Menlo:h12
set guioptions-=T
set guioptions-=r
set guioptions-=L

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . a:directory
  endif

  if directory && g:janus_nerd_tree_persists
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction
