runtime colors/ir_black.vim

let g:colors_name = "ir_rob"

hi pythonSpaceError ctermbg=red guibg=red

hi Comment ctermfg=242 guifg=#7b7d7b

hi StatusLine cterm=NONE ctermbg=236 ctermfg=120 gui=NONE guibg=#3f3f3f guifg=#00ff77
hi StatusLineNC ctermbg=233 ctermfg=242 guibg=#171717 guifg=#7b7d7b

hi VertSplit ctermbg=0 ctermfg=242 guibg=#000000 guifg=#7b7d7b
hi LineNr ctermfg=242 guifg=#7b7d7b
hi CursorLine     guifg=NONE        guibg=#1c1c1c     gui=NONE      ctermfg=NONE        ctermbg=234        cterm=BOLD
hi CursorColumn   guifg=NONE        guibg=#1c1c1c     gui=NONE      ctermfg=NONE        ctermbg=234        cterm=BOLD
hi Function guifg=#FFD2A7 guibg=NONE gui=NONE ctermfg=yellow ctermbg=NONE cterm=NONE
hi Visual guifg=NONE guibg=#262D51 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE

hi Error guifg=NONE guibg=NONE gui=undercurl ctermfg=45 ctermbg=19 cterm=NONE term=NONE guisp=#FF6C60
hi ErrorMsg guifg=white guibg=#FF6C60 gui=BOLD ctermfg=16 ctermbg=red cterm=NONE
hi htmlError guifg=red gui=BOLD ctermfg=9 cterm=NONE
hi htmlItalic guibg=black ctermbg=0 gui=NONE cterm=NONE
hi WarningMsg guifg=white guibg=#FF6C60 gui=BOLD ctermfg=16 ctermbg=red cterm=NONE
hi SpellBad guifg=#FF6C60 guibg=black gui=underline ctermfg=160 ctermbg=0 cterm=underline
hi Search guifg=#000000 guibg=#87ff5f gui=BOLD ctermfg=16 ctermbg=119 cterm=NONE
hi Operator guifg=#6699CC guibg=#1D1E2C gui=NONE ctermfg=lightblue ctermbg=NONE cterm=NONE

hi DiffAdd term=reverse cterm=bold ctermbg=lightgreen ctermfg=16
hi DiffChange term=reverse cterm=bold ctermbg=lightblue ctermfg=16
hi DiffText term=reverse cterm=bold ctermbg=lightgray ctermfg=16
hi DiffDelete term=reverse cterm=bold ctermbg=lightred ctermfg=16

hi PmenuSel ctermfg=16 ctermbg=156

hi TabLineFill guibg=darkgray guifg=#171717 ctermbg=darkgray ctermfg=233
hi TabLineSel guibg=darkgray guifg=lightgreen ctermbg=236 ctermfg=120
hi TabLine guibg=black guifg=darkgray gui=NONE ctermbg=black ctermfg=darkgray cterm=NONE
