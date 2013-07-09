set nocompatible
filetype off
let g:vundle_default_git_proto='http'
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-powerline'
Bundle 'pangloss/vim-javascript'
"Bundle 'Yggdroot/indentLine'

syntax on
filetype plugin indent on

" make sure myvimrc is pointing at the correct file
let $MYVIMRC='~/.vim/.vimrc'

set syn=auto
set background=dark
set t_Co=256
colorscheme solarized
let g:Powerline_symbols = 'fancy'

" ctrlp configs
let g:ctrlp_clear_cache_on_exit=0 " keep cache files across multiple session - remember to use F5 to refresh as needed
let g:ctrlp_working_path_mode=0 " don't manage
let g:ctrlp_extensions = ['funky']

" indentLine configs
let g:indentLine_enabled=0 " off when vim starts

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
set matchtime=0
set hlsearch
nnoremap <leader><space> :noh<CR>

set wrap
set formatoptions=qrn1
" because we're wrapping makes you can traverse each line on the screen
nnoremap j gj
nnoremap k gk

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

set pastetoggle=<F3>
"map <F9> :IndentLinesToggle<CR>

nnoremap <leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <leader>fU :execute 'CtrlPFunky '.expand('<cword>')<Cr>

nmap <leader>d :w !diff % -<CR>

nmap <leader>s :setlocal spell! spell?<CR>
set spelllang=en_us

nnoremap <leader>t <Esc>:tabnew<CR>

nmap , :NERDTreeToggle<CR>

autocmd BufEnter * syntax sync fromstart
autocmd BufRead *.md set syntax=markdown ft=markdown
autocmd BufRead *.phph set syntax=php ts=4 sw=4 ft=php
autocmd BufRead *.php set syntax=php ts=4 sw=4 ft=php
autocmd BufRead *.css set syntax=css ts=4 sw=4 ft=css
autocmd BufRead *.rb set syntax=ruby ts=2 sw=2 ft=ruby
autocmd BufRead *.js set syntax=javascript ts=4 sw=4 ft=javascript
autocmd BufRead *.json set syntax=javascript ts=4 sw=4 ft=javascript
autocmd BufRead *.tmpl set syntax=html ts=2 sw=2 ft=html
autocmd BufRead *.ejs set syntax=html ts=2 sw=2 ft=html
autocmd BufRead *.html set syntax=html ts=2 sw=2 ft=html
autocmd BufRead *.yml set syntax=yaml ts=2 sw=2 ft=yaml
autocmd BufRead *.ino,*.pde set syntax=cpp ts=2 sw=2 ft=cpp

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

let php_baselib = 1
let php_htmlInStrings = 1

set wildignore+=*/tmp/*,*/generated/*,*/optimized/*,*/_site/*
set wildmenu
set wildmode=longest,list

