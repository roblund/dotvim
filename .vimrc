set nocompatible
filetype off
let g:vundle_default_git_proto='git'
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'pangloss/vim-javascript'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'terryma/vim-expand-region'
Bundle 'tpope/vim-endwise'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tpope/vim-commentary'
Bundle 'mileszs/ack.vim'

syntax on
filetype plugin indent on

let $MYVIMRC='~/.vim/.vimrc'

set syn=auto
set background=dark
set t_Co=256
if &term =~ '256color'
    set t_ut=
endif
colorscheme solarized
set ttimeoutlen=50

let g:ctrlp_clear_cache_on_exit=0 " keep cache files across multiple sessions - f5 to refresh
let g:ctrlp_working_path_mode=0 " don't manage working path
let g:ctrlp_max_files=100000
let g:ctrlp_extensions=['buffertag']
let g:ctrlp_match_window='max:15'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

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

set statusline=
set statusline +=%*%<%f%* "full path
set statusline +=%*%m%* "modified flag
set statusline +=%*%=%5l%* "current line
set statusline +=%*/%L%* "total lines
set statusline +=%*\ %y%* "file type

hi statusline guibg=#444444 guifg=#ffffff ctermbg=238 ctermfg=15 cterm=none gui=none
hi statuslineNC guibg=#121212 guifg=#585858 ctermbg=233 ctermfg=240 cterm=none gui=none

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
noremap gV `[v`]

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

set pastetoggle=<F3>

let mapleader="\<Space>"

" search project
nmap <leader>a :Ack

" remove search highlight
nnoremap <leader>h :noh<CR>

" save file
nnoremap <Leader>w :w<CR>

" comment/uncomment
nmap <leader>c gcc
vmap <leader>c gc

" select region expand/contract
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" show unsaved changes (slightly nicer than :changes)
nmap <leader>d :w !diff % -<CR>

" spellcheck
nmap <leader>s :setlocal spell! spell?<CR>
set spelllang=en_us

nnoremap <leader>t <Esc>:tabnew<CR>

nnoremap <Leader>o :CtrlP<CR>
nnoremap <leader>b <Esc>:CtrlPBuffer<CR>
nnoremap <leader>g <Esc>:CtrlPBufTag<CR>

" copy/paste from system buffer
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

map q: :q

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.ino,*.pde set filetype=cpp

let php_baselib = 1
let php_htmlInStrings = 1

set wildignore+=*/tmp/*,*/generated/*,*/optimized/*,*/cp/versions/*,*/_site/*
set wildmenu
set wildmode=longest,list
