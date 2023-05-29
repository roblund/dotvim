" rob's vimrc - reload with :source %

set nocompatible
filetype off

let g:plug_url_format='git@github.com:%s.git'
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'dense-analysis/ale'
Plug 'vim-test/vim-test'
Plug 'tomtom/tcomment_vim'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'mileszs/ack.vim'
Plug 'justinmk/vim-sneak'

Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

call plug#end()

filetype plugin indent on
syntax on

let $MYVIMRC='~/.vim/.vimrc'

set background=dark
colorscheme ir_rob

let g:filebeagle_suppress_keymaps=1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

let g:sneak#label = 1

let g:ale_linters = {
\   'handlebars': [],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'vue': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'json': ['prettier'],
\   'markdown': ['prettier'],
\   'yaml': ['prettier'],
\   'xml': ['xmllint'],
\   'html': [],
\   'handlebars': []
\}

let test#strategy = 'neovim'

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.5, 'border': 'sharp'} }
let g:fzf_preview_window = ['right,40%', 'ctrl-/']
let $FZF_DEFAULT_OPTS = '--reverse'

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=3
set smartindent
set splitright
set number
set colorcolumn=80
set guicursor=
set ignorecase
set infercase
set smartcase
set noswapfile
set mouse=nv
set complete=.,b,kspell
set wildignore+=*/tmp/*,*/generated/*,*/optimized/*,*/_site/*,*DS_Store*,*/src/public/*,*/node_modules/*,*/coverage-reports/*,*.map
set wildmode=longest,list

set statusline=
set statusline +=%#warningmsg#
set statusline +=%*
set statusline +=%*\ %<%f\ %* "full path
set statusline +=%*%m%* "modified flag
set statusline +=%*%=%5l%* "current line
set statusline +=%*/%L\%* "total lines
set statusline +=%*:%c\ %* "column in line
set statusline +=%*%y%* "file type

set formatoptions=qn1
set wrap
" move by display line
nnoremap j gj
nnoremap k gk

" when using ctrl-u/d re-center
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" pop up menu mappings
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

" highlight what you just pasted
" note: [ ] mark the beginning and end of your paste, < > mark your selection
nnoremap gV `[v`]

let mapleader="\<Space>"

" harpoon
nnoremap <leader>ja :lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>jl :lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <leader>j1 :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <leader>j2 :lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <leader>j3 :lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <leader>j4 :lua require("harpoon.ui").nav_file(4)<cr>

nnoremap <C-P> :Files<cr>
nnoremap \ :Rg<cr>
nnoremap <leader>f :BLines<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>q :close<cr>
nnoremap <leader>d :w !diff % -<cr>
nnoremap <leader>h :nohl<cr>
nnoremap <leader>0 :TestNearest<cr>
nnoremap <leader>9 :TestFile<cr>
nnoremap <leader>e :ALENextWrap<cr>
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>R :syntax sync fromstart<cr>
nnoremap <leader>/ :Helptags<cr>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gf :diffget //3<cr>
nnoremap <leader>gj :diffget //2<cr>
nnoremap <leader>gb :GBrowse<cr>
nnoremap <silent> - :FileBeagleBufferDir<cr>

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

set grepprg=rg\ --vimgrep\ --smart-case\ --follow
" open the quick fix list after a quick fix command, eg. :grep
autocmd QuickFixCmdPost *grep* cwindow

" identify the Vim syntax highlighting group
:command! SynGroup echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"

if has("persistent_undo")
    set undodir=$HOME/.undodir
    set undofile
endif

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
