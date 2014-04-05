set nocompatible
filetype off
let g:vundle_default_git_proto='git'
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-commentary'
Bundle 'pangloss/vim-javascript'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-vinegar'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'vimwiki'

syntax on
filetype plugin indent on

let $MYVIMRC='~/.vim/.vimrc'

set syn=auto
set background=dark
set t_Co=256
if &term =~ '256color'
    set t_ut=
endif
colorscheme grb256
set ttimeoutlen=50

let g:ctrlp_clear_cache_on_exit=0 " keep cache files across multiple sessions - f5 to refresh
let g:ctrlp_working_path_mode=0 " don't manage working path
let g:ctrlp_max_files=100000
let g:ctrlp_extensions=['buffertag']
let g:ctrlp_match_window='max:15'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

let g:vimwiki_list=[{'path': '~/Dropbox/VimWiki', 'ext': '.md', 'syntax': 'markdown'}]

let g:bufExplorerShowRelativePath=1

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
set ttymouse=xterm2
set showmode
set showcmd
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set history=1000
set splitright
set nrformats=
set number

set statusline=
set statusline +=%*%<%f\ %* "full path
set statusline +=%*%m%* "modified flag
set statusline +=%*%=%5l%* "current line
set statusline +=%*/%L%* "total lines
set statusline +=%*\ %y%* "file type

set fillchars=stl:-,stlnc:-,vert:\|,fold:-,diff:-

hi statusline guibg=#444444 guifg=#ffffff ctermbg=238 ctermfg=15 cterm=none gui=none
hi statuslineNC guifg=#585858 ctermfg=240 cterm=none gui=none

hi VertSplit cterm=none ctermfg=238
hi VertSplit gui=none guifg=#444444

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

set tags=tags

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set matchtime=0
set hlsearch

set wrap
set formatoptions=qrn1
" because we're wrapping makes you can traverse each line on the screen
nnoremap j gj
nnoremap k gk

" highlight what you just pasted
nnoremap gV `[v`]

" remove search highlight
nnoremap coh :noh<CR>

" show unsaved changes (slightly nicer than :changes)
nnoremap cod :w !diff % -<CR>

" spellcheck
nnoremap cos :setlocal spell! spell?<CR>
set spelllang=en_us

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

set pastetoggle=<F3>

let mapleader="\<Space>"

nnoremap <leader>t <Esc>:tabnew<CR>
nnoremap <leader>o <Esc>:CtrlP<CR>
nnoremap <leader>f <Esc>:CtrlPBufTag<CR>
nnoremap <leader>q <Esc>:e #<CR> " technically switches back to previous buffer

" copy/paste from system buffer
vmap <leader>y "+y
nmap <leader>p "+p
vmap <leader>p "+p

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.ino,*.pde set filetype=cpp

let php_baselib = 1
let php_htmlInStrings = 1

set wildignore+=*/tmp/*,*/generated/*,*/optimized/*,*/cp/versions/*,*/_site/*
set wildmenu
set wildmode=longest,list
