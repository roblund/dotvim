set nocompatible
filetype off
execute pathogen#infect()

syntax on
filetype plugin indent on

set syn=auto
set background=dark
set t_Co=256
" colorscheme koehler
" colorscheme torte
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
set undofile
set undolevels=1000
set backup
set backupdir=~/tmp,. " for *nix
" set backupdir=c:/tmp,c:/temp,. " for win32

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

set wrap
set formatoptions=qrn1

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

nnoremap j gj
nnoremap k gk

inoremap jj <ESC>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

au FocusLost * :wa

nnoremap <leader>v V`]
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>t <Esc>:tabnew<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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

" press <F2> before and after pasting to prevent cascading indentations when pasting in text
set pastetoggle=<F2>

let g:ctrlp_clear_cache_on_exit=0 " keep cache files across multiple session - remember to use F5 to refresh as needed
let g:ctrlp_working_path_mode=0 " don't manage
