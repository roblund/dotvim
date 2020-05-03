" writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'

nnoremap <leader>W :Goyo<cr>

let g:pencil#wrapModeDefault='soft'

augroup writing
    autocmd!
    autocmd User GoyoEnter call <SID>goyo_enter()
    autocmd User GoyoLeave call <SID>goyo_leave()
augroup END

function! s:goyo_enter()
    " turn on pencil
    Pencil

    " setup goyo so :q will completely quit vim
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
    " turn off pencil
    NoPencil

    " quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        if b:quitting_bang
            qa!
        else
            qa
        endif
    endif
endfunction
