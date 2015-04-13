set nocompatible
filetype off
let g:vundle_default_git_proto='git'
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" general
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'CursorLineCurrentWindow'
Plugin 'csexton/trailertrash.vim'
Plugin 'bufexplorer.zip'
Plugin 'ervandew/supertab'
Plugin 'haya14busa/incsearch.vim'

" tim pope section
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-vinegar'

" language specific
Plugin 'pangloss/vim-javascript'
Plugin 'vim-ruby/vim-ruby'

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
let g:ctrlp_match_window='max:18'

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
set hidden
set nrformats=
set number
set cursorline

set statusline=
set statusline +=%*(%n)\ %* " buffer number
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
set showmatch
set matchtime=0
set incsearch
set hlsearch

set wrap
set formatoptions=qrn1
" move by display line
nnoremap j gj
nnoremap k gk

" highlight what you just pasted
nnoremap gV `[v`]

set pastetoggle=<F3>

let mapleader="\<Space>"

nnoremap <silent> <F11> :BufExplorer<CR>
nnoremap <silent> <m-F11> :BufExplorerHorizontalSplit<CR>
nnoremap <silent> <c-F11> :BufExplorerVerticalSplit<CR>

nnoremap <leader><leader> <C-^>
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>b :BufExplorer<cr>
nnoremap <leader>j :CtrlPMRU<cr>
nnoremap <leader>f :CtrlPFunky<cr>
nnoremap <Leader>F :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
nnoremap <leader>d :w !diff % -<cr>
nnoremap <leader>h :nohl<cr>

" copy/paste from system buffer
vmap <leader>y "+y
nmap <leader>p "+p
vmap <leader>p "+p

" pbcopy
vmap <leader>c :w !pbcopy<CR><CR>

" haya incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" setup visual */# search
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

" identify the syntax highlighting group
:command SynGroup echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.ino,*.pde set filetype=cpp
au BufRead,BufNewFile *.ejs set filetype=eruby

let php_baselib=1
let php_htmlInStrings=1

set wildignore+=*/tmp/*,*/generated/*,*/optimized/*,*/cp/versions/*,*/_site/*,*DS_Store*
set wildmenu
set wildmode=longest,list

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif
