
set nocompatible
filetype off

" to download vim-plug use: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
let g:plug_url_format='git@github.com:%s.git'
call plug#begin('~/.vim/plugged')

" general
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'CursorLineCurrentWindow'
Plug 'csexton/trailertrash.vim'
Plug 'bufexplorer.zip'
Plug 'ervandew/supertab'
Plug 'haya14busa/incsearch.vim'
Plug 'mileszs/ack.vim'
Plug 'Mouse-Toggle'
Plug 'junegunn/vim-peekaboo'
Plug 'vim-syntastic/syntastic'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'davidoc/taskpaper.vim'

" writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-wordy'

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
Plug 'davidosomething/syntastic-hbstidy'
Plug 'elixir-lang/vim-elixir'

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

" let g:ctrlp_clear_cache_on_exit=0 " keep cache files across multiple sessions - f5 to refresh
let g:ctrlp_working_path_mode=0 " don't manage working path
let g:ctrlp_max_files=100000
let g:ctrlp_match_window='max:18'

let $FZF_DEFAULT_COMMAND = 'pt -l -g -S ""'

let g:bufExplorerShowRelativePath=1

let g:filebeagle_suppress_keymaps=1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

let g:lexical#spell_key='<leader>s'
let g:lexical#thesaurus_key='<leader>S'
set complete+=kspell

let g:pencil#wrapModeDefault='soft'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_filetype_map = { "html.handlebars": "handlebars" }
let g:syntastic_handlebars_checkers = ["handlebars", "hbstidy"]
let g:syntastic_javascript_checkers = ['eslint']

augroup writing
    autocmd!
    autocmd User GoyoEnter call <SID>goyo_enter()
    autocmd User GoyoLeave call <SID>goyo_leave()
augroup END

function! s:goyo_enter()
    " turn on lexical
    call lexical#init()
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

let g:ackprg="pt -S --column --ignore='*optimized*'"
let g:ackhighlight=1
let g:ack_autofold_results=1

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
set cryptmethod=blowfish2
" set cursorline " colors are cleared out in ir_rob, but I like the line number highlight

set statusline=
set statusline +=%#warningmsg#
set statusline +=%{SyntasticStatuslineFlag()}
set statusline +=%*
set statusline +=%*(%n)\ %* " buffer number
set statusline +=%*%<%f\ %* "full path
set statusline +=%*%m%* "modified flag
set statusline +=%*%=%5l%* "current line
set statusline +=%*/%L\ %* "total lines
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

set tags=tags

set ignorecase
set infercase
set smartcase
set gdefault
set showmatch
set matchtime=0
set incsearch
set hlsearch

" have vim use the older regex engine for now (problems with cursorline)
set re=1

set wrap
set formatoptions=qn1
" move by display line
nnoremap j gj
nnoremap k gk

" disable default bufexplorer commands
nnoremap <silent> <F11> :BufExplorer<CR>
nnoremap <silent> <m-F11> :BufExplorerHorizontalSplit<CR>
nnoremap <silent> <c-F11> :BufExplorerVerticalSplit<CR>

" highlight what you just pasted
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

nnoremap <leader><leader> <C-^>
nnoremap <leader>ot :split ~/Dropbox/Notes/taskpaper/Tasks.txt <bar> resize 20<cr>
nnoremap <leader>sn :SearchNotes<space>
nnoremap <leader>nt :tabnew<cr>
nnoremap <leader>cq :cclose<cr>
nnoremap <leader>b :BufExplorer<cr>
nnoremap <leader>j :CtrlPMRU<cr>
nnoremap <silent> - :FileBeagleBufferDir<cr>
nnoremap <leader>f :CtrlPFunky<cr>
nnoremap <Leader>F :execute 'CtrlPFunky ' . expand('<cword>')<cr>
nnoremap <leader>d :w !diff % -<cr>
nnoremap <leader>h :nohl<cr>
nnoremap <leader>a :Ack<space>
nnoremap <leader>w :Goyo<cr>
nnoremap <leader>f :Files<cr>

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

" haya incsearch, only load in vim 7.3 and higher
if v:version >= 703
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
endif

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

:command! -narg=1 SearchNotes Ack <f-args> ~/Dropbox/Notes/

" identify the syntax highlighting group
:command! SynGroup echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"

augroup files
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile Tasks.txt set filetype=taskpaper
    autocmd BufRead,BufNewFile *.ino,*.pde set filetype=cpp
    autocmd BufRead,BufNewFile *.ejs set filetype=eruby
    autocmd BufRead,BufNewFile *.js.php set filetype=javascript
augroup END

set wildignore+=*/tmp/*,*/generated/*,*/optimized/*,*/cp/versions/*,*/_site/*,*DS_Store*,*/node_modules/*,*.map
set wildmenu
set wildmode=longest,list

if exists('$TMUX') || !has('gui_running')
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
