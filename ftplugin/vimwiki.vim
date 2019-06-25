augroup todofile
    set autoread
    set updatetime=500
    autocmd CursorHold,CursorHoldI * checktime
    autocmd FocusGained,BufEnter * :silent! !
    autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END

map <silent><buffer> ]h <Plug>VimwikiAddHeaderLevel
map <silent><buffer> [h <Plug>VimwikiRemoveHeaderLevel
map <silent><buffer> <Leader>tt <Plug>VimwikiToggleListItem

set textwidth=100

