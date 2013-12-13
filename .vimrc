set nocompatible
filetype off
let g:vundle_default_git_proto='git'
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
"Bundle 'altercation/vim-colors-solarized'
Bundle 'w0ng/vim-hybrid'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-surround'

syntax on
filetype plugin indent on

let $MYVIMRC='~/.vim/.vimrc'

set syn=auto
set background=dark
set t_Co=256
colorscheme hybrid
set ttimeoutlen=50

" ctrlp configs
let g:ctrlp_clear_cache_on_exit = 0 " keep cache files across multiple sessions - f5 to refresh
let g:ctrlp_working_path_mode = 0 " don't manage working path
let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_match_window = 'max:15'

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

hi statusline guibg=#121212 guifg=#00ff5f ctermbg=233 ctermfg=47 cterm=none gui=none
hi statuslineNC guibg=#1c1c1c guifg=#585858 ctermbg=234 ctermfg=240 cterm=none gui=none

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

" show unsaved changes
nmap <leader>d :w !diff % -<CR>

" spellcheck
nmap <leader>s :setlocal spell! spell?<CR>
set spelllang=en_us

nnoremap <leader>t <Esc>:tabnew<CR>

nnoremap <leader>b <Esc>:CtrlPBuffer<CR>
nnoremap <leader>g <Esc>:CtrlPBufTag<CR>

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.ino,*.pde set filetype=cpp

let php_baselib = 1
let php_htmlInStrings = 1

set wildignore+=*/tmp/*,*/generated/*,*/optimized/*,*/_site/*
set wildmenu
set wildmode=longest,list
