set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'

syntax on
filetype plugin indent on

set syn=auto
set background=dark
set t_Co=256
colorscheme solarized

set modelines=0

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set encoding=utf-8
set scrolloff=3
set autoindent
set mouse=a
set ttymouse=xterm2
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set history=1000

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

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

set wrap
set formatoptions=qrn1
" because we're wrapping makes you can traverse each line on the screen
nnoremap j gj
nnoremap k gk

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"inoremap jj <ESC>

" basically turn off F1(help)
map <F1> <ESC>

set pastetoggle=<F2>

map <F5> :bp!<CR>
imap <F5> <ESC>:bp!<CR>
map <C-F5> :bw<CR>
imap <C-F5> <ESC>:bw<CR>

map <F7> :setlocal spell! spell?<CR>
imap <F7> <ESC>:setlocal spell! spell?<CR>

nnoremap <leader>v V`]
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>t <Esc>:tabnew<CR>

nmap , :NERDTreeToggle<cr>

autocmd BufEnter * syntax sync fromstart
autocmd BufRead *.md set syntax=markdown ft=markdown
autocmd BufRead *.phph set syntax=php ts=4 sw=4 ft=php
autocmd BufRead *.php set syntax=php ts=4 sw=4 ft=php
autocmd BufRead *.rb set syntax=ruby ts=2 sw=2 ft=ruby
autocmd BufRead *.json set syntax=javascript ts=4 sw=4 ft=javascript
autocmd BufRead *.tmpl set syntax=html ts=2 sw=2 ft=html
autocmd BufRead *.html set syntax=html ts=2 sw=2 ft=html

let php_baselib = 1
let php_htmlInStrings = 1

set wildignore+=*/tmp/*,*/generated/*,*/optimized/*,*/_site/*

" ctrlp configs
let g:ctrlp_clear_cache_on_exit=0 " keep cache files across multiple session - remember to use F5 to refresh as needed
let g:ctrlp_working_path_mode=0 " don't manage

