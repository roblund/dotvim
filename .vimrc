set nocompatible
filetype off
let g:vundle_default_git_proto='git'
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'mileszs/ack.vim'
Plugin 'CursorLineCurrentWindow'

Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'

Plugin 'csexton/trailertrash.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-ruby/vim-ruby'
Plugin 'matchit.zip'

call vundle#end()

filetype plugin indent on
syntax on

let $MYVIMRC='~/.vim/.vimrc'

set syn=auto
set background=dark
set t_Co=256
if &term =~ '256color'
    set t_ut=
endif
colorscheme ir_rob
set ttimeoutlen=50

let g:ctrlp_clear_cache_on_exit=0 " keep cache files across multiple sessions - f5 to refresh
let g:ctrlp_working_path_mode=0 " don't manage working path
let g:ctrlp_max_files=100000
let g:ctrlp_extensions=['buffertag']
let g:ctrlp_match_window='max:18'

let g:ackhighlight = 1
let g:ack_default_options =
      \ " -s -H --nocolor --nogroup --smart-case --follow"

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
set hidden
set nrformats=
set number
set cursorline

set statusline=
set statusline +=%*%<%f\ %* "full path
set statusline +=%*%m%* "modified flag
set statusline +=%*%=%5l%* "current line
set statusline +=%*/%L%* "total lines
set statusline +=%*\ %y%* "file type

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
set infercase
set smartcase
set gdefault
set incsearch
set showmatch
set matchtime=0
set hlsearch

set wrap
set formatoptions=qrn1
" I prefer to move by display line
nnoremap j gj
nnoremap k gk

" highlight what you just pasted
nnoremap gV `[v`]

set pastetoggle=<F3>

let mapleader="\<Space>"

nnoremap <leader>t <Esc>:tabnew<CR>
nnoremap <leader>b <Esc>:CtrlPBuffer<CR>
nnoremap <leader>f <Esc>:CtrlPBufTag<CR>
nnoremap <leader>h <Esc>:noh<CR>
nnoremap <leader>d <Esc>:w !diff % -<CR> " slightly nicer than :changes
nnoremap <leader>s <Esc>:setlocal spell! spell?<CR>

" copy/paste from system buffer
vmap <leader>y "+y
nmap <leader>p "+p
vmap <leader>p "+p

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.ino,*.pde set filetype=cpp

let php_baselib = 1
let php_htmlInStrings = 1

set wildignore+=*/tmp/*,*/generated/*,*/optimized/*,*/cp/versions/*,*/_site/*,*/.DS_Store
set wildmenu
set wildmode=longest,list

" setup visual */# search
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction
