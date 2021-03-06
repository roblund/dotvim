" rob's neovimrc - reload with :source %
filetype off

" to download vim-plug use: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
let g:plug_url_format='git@github.com:%s.git'
call plug#begin('~/.local/share/nvim/plugged')

" general
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'csexton/trailertrash.vim'
Plug 'bufexplorer.zip'
Plug 'ervandew/supertab'
Plug 'Mouse-Toggle'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'easymotion/vim-easymotion'

" writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'

" tim pope section
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'

" language specific
Plug 'kchmck/vim-coffee-script'
Plug 'vim-ruby/vim-ruby'
Plug 'mustache/vim-mustache-handlebars'
Plug 'elixir-lang/vim-elixir'
Plug 'davidoc/taskpaper.vim'

call plug#end()

filetype plugin indent on
syntax on

set background=dark
set t_Co=256
if &term =~ '256color'
    set t_ut=
endif
colorscheme ir_rob
set ttimeoutlen=50

if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --vimgrep\ --hidden\ --smart-case
    set grepformat=%f:%l:%m

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif
let g:ctrlp_working_path_mode=0 " don't manage working path
let g:ctrlp_max_files=100000
let g:ctrlp_match_window='max:25'

let g:bufExplorerShowRelativePath=1

let g:filebeagle_suppress_keymaps=1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

set complete+=kspell

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

set modelines=0
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set encoding=utf-8
set scrolloff=3
set smartindent
set showmode
set showcmd
set ruler
set history=1000
set splitright
set hidden
set number

set statusline=
set statusline +=%#warningmsg#
set statusline +=%*
set statusline +=%*%<%f\ %* "full path
set statusline +=%*%m%* "modified flag
set statusline +=%*%=%5l%* "current line
set statusline +=%*/%L\ %* "total lines
set statusline +=%*%y%* "file type

set ignorecase
set infercase
set smartcase
set gdefault
set showmatch
set matchtime=0
set incsearch
set nohlsearch

" have vim use the older regex engine for now (problems with cursorline)
set re=1

set wrap
set formatoptions=qn1

" move by display line
nnoremap j gj
nnoremap k gk

" remap beginning and end of line
nnoremap <S-B> ^
nnoremap <S-E> $

" disable default bufexplorer commands
nnoremap <silent> <F11> :BufExplorer<CR>
nnoremap <silent> <m-F11> :BufExplorerHorizontalSplit<CR>
nnoremap <silent> <c-F11> :BufExplorerVerticalSplit<CR>

" map \ to grep/ag now that space is my leader key
"   command mapping breakdown: num args - one or more, completion - file mode, followed my more
"   commands separated by a |, 'FindInFiles' maps to silent grep, afterward open quickfix list in
"   the far bottom right 25 lines tall, force a redraw
command! -nargs=+ -complete=file -bar FindInFiles silent! grep! <args>|botright copen 25|redraw!
nnoremap \ :FindInFiles<space>

" change K to grep/ag for the word under the cursor
nnoremap K :FindInFiles "<C-R><C-W>"<cr>

" highlight what you just pasted
" note: '] moves to a mark at the end of your paste
nnoremap gV `[v`]

set pastetoggle=<F3>

let mapleader="\<Space>"

if has("gui_macvim")
    " open file in Marked 2
    function! MarkedOpen()
        silent execute '!open -a "Marked 2" ' . bufname('%')
        redraw!
    endfunction

    :command! Marked :call MarkedOpen()
    nnoremap <leader>2 :call MarkedOpen()<cr>
endif

nnoremap <leader>t :tabnew<cr>
nnoremap <leader>cq :cclose<cr>
nnoremap <leader>b :BufExplorer<cr>
nnoremap <leader>f :CtrlPFunky<cr>
nnoremap <leader>d :w !diff % -<cr>
nnoremap <leader>w :Goyo<cr>

nnoremap <silent> - :FileBeagleBufferDir<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
" ctrl-h is backspace depending on your terminal
nnoremap <BS> <C-W><C-H>

" copy/paste from system buffer
vmap <leader>y "+y
nmap <leader>p "+p
vmap <leader>p "+p

" pbcopy
vmap <leader>c :<C-u>call PBCopy()<cr><cr>

function! PBCopy()
    let temp = @s
    " go to last/current visual selection, and yank it into the "s register
    norm! gv"sy
    call system('pbcopy', @s)
    let @s = temp
endfunction

" setup visual */# search
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:VSetSearch()
    let temp = @s
    " go to last/current visual selection, and yank it into the "s register
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

" identify the syntax highlighting group
:command! SynGroup echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"

augroup files
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.ino,*.pde set filetype=cpp
    autocmd BufRead,BufNewFile *.ejs set filetype=eruby
augroup END

augroup windowTypes
    autocmd!
    autocmd filetype qf wincmd J
augroup END

set wildignore+=*/tmp/*,*/generated/*,*/optimized/*,*/_site/*,*DS_Store*,*/node_modules/*,*.map
set wildmode=longest,list
