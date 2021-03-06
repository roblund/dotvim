" rob's vimrc - reload with :source %

set nocompatible
filetype off

let g:plug_url_format='git@github.com:%s.git'
call plug#begin('~/.vim/plugged')

" general
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'jlanzarotta/bufexplorer'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'ervandew/supertab'
Plug 'dense-analysis/ale'
Plug 'ntpeters/vim-better-whitespace'
Plug 'yssl/QFEnter'
Plug 'janko-m/vim-test'
Plug 'vimwiki/vimwiki'
Plug 'mkitt/tabline.vim'
Plug 'tomtom/tcomment_vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sheerun/vim-polyglot'

" tim pope section
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'

call plug#end()

filetype plugin indent on
syntax on

let $MYVIMRC='~/.vim/.vimrc'

set background=dark
set t_Co=256
if &term =~ '256color'
    set t_ut=
endif
colorscheme ir_rob
set ttimeoutlen=50

let g:bufExplorerShowRelativePath=1
let g:bufExplorerDisableDefaultKeyMapping=1

let g:filebeagle_suppress_keymaps=1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

let g:gutentags_cache_dir= '~/.tags'

let g:vimwiki_list = [{
    \'path': '~/Dropbox/Notes/vimwiki',
    \'ext': '.mkd',
    \'diary_rel_path': 'log/',
    \'diary_index': 'index',
    \'diary_header': 'Log'
    \}]
let g:vimwiki_hl_headers = 1

if executable('rg')
  set grepprg=rg\ --color=never
  set grepformat=%f:%l:%m
  let g:ctrlp_user_command = "rg '%s' --files --hidden --color=never --glob ''"
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_map = ''
let g:ctrlp_working_path_mode=0 " don't manage working path
let g:ctrlp_max_files=100000
let g:ctrlp_match_window='max:25,min:15'

let g:vue_pre_processors = ['scss']

let g:ale_linters = {
\   'handlebars': [],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'vue': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'json': ['prettier'],
\   'markdown': ['prettier'],
\   'html': [],
\   'handlebars': []
\}

let test#strategy = 'vimterminal'
let g:test#javascript#mocha#executable = 'npm run single-test --silent'

set complete+=kspell

if !has('nvim')
    set ttymouse=xterm2
endif
if has('mouse_sgr')
    set ttymouse=sgr
endif

set modelines=0
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set mouse=a
set showmode
set showcmd
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set history=1000
set splitright
set hidden
set nrformats=
set number
set colorcolumn=100
set guicursor=
set redrawtime=10000

set statusline=
set statusline +=%#warningmsg#
set statusline +=%*
set statusline +=%*\ %<%f\ %* "full path
set statusline +=%*%m%* "modified flag
set statusline +=%*%=%{fugitive#statusline()} "git branch
set statusline +=%*%=%5l%* "current line
set statusline +=%*/%L\%* "total lines
set statusline +=%*:%c\ %* "column in line
set statusline +=%*%y%* "file type

if exists("+undofile")
    " save undofiles in a less annoying spot
    if isdirectory($HOME . '/.vim/undo') == 0
        :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
    endif
    set undofile
    set undolevels=1000
    set undodir=~/.vim/undo//,.
endif

" save swapfiles in a less annoying spot
if isdirectory($HOME . '/.vim/swap') == 0
    :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=~/.vim/swap//,.

" save backups in a less annoying spot
if isdirectory($HOME . '/.vim/backup') == 0
    :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backup
set backupdir=~/.vim/backup//,.

" set tags=tags

set ignorecase
set infercase
set smartcase
set gdefault
set showmatch
set matchtime=0
set incsearch
set hlsearch

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

nnoremap <silent> - :FileBeagleBufferDir<cr>

" highlight what you just pasted
" note: '] moves to a mark at the end of your paste
nnoremap gV `[v`]

set pastetoggle=<F3>

let mapleader="\<Space>"

nnoremap <C-P> :Files<cr>
nnoremap \ :Rg<cr>

nnoremap <leader>f :CtrlPFunky<cr>
nnoremap <leader>j :BTags<cr>
nnoremap <leader>b :BufExplorer<cr>
nnoremap <leader>q :close<cr>
nnoremap <leader>d :w !diff % -<cr>
nnoremap <leader>h :nohl<cr>
nnoremap <leader>0 :TestFile<cr>
nnoremap <leader>9 :TestLast<cr>
nnoremap <leader>e :ALENextWrap<cr>
nnoremap <leader>E :ALEPreviousWrap<cr>
nnoremap <leader>m :call ToggleMouse()<cr>
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>r :syntax sync fromstart<cr>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gf :diffget //3<cr>
nnoremap <leader>gj :diffget //2<cr>
nnoremap <leader>gd :Gdiffsplit!<cr>

" paste from system buffer
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

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" internal vim terminal mappings
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>


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

function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
        echo "Mouse Off"
    else
        " enable mouse everywhere
        set mouse=a
        echo "Mouse On"
    endif
endfunc

" identify the Vim syntax highlighting group
:command! SynGroup echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"

augroup files
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.ino,*.pde set filetype=cpp
    autocmd BufRead,BufNewFile *.ejs set filetype=eruby
    autocmd BufRead,BufNewFile *.love set filetype=lua
augroup END

augroup windowTypes
    autocmd!
    autocmd filetype qf wincmd J
augroup END

set wildignore+=*/tmp/*,*/generated/*,*/optimized/*,*/_site/*,*DS_Store*,*/src/public/*,*/node_modules/*,*/coverage-reports/*,*.map
set wildmenu
set wildmode=longest,list
