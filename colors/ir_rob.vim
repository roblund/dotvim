runtime colors/ir_black.vim

let g:colors_name = "ir_rob"

hi Normal ctermfg=15 guifg=white

hi pythonSpaceError ctermbg=red guibg=red

hi Comment ctermfg=245 guifg=#8a8a8a

hi taskpaperDone ctermfg=245 guifg=#8a8a8a

hi StatusLine cterm=NONE ctermbg=87 ctermfg=235 gui=NONE guibg=#5fffff guifg=#262626
hi StatusLineNC ctermbg=238 ctermfg=250 guibg=#444444 guifg=#bcbcbc

hi ColorColumn ctermbg=235 ctermfg=250 guibg=#262626 guifg=#bcbcbc
hi SignColumn ctermbg=NONE ctermfg=250 guibg=NONE guifg=#bcbcbc

hi VertSplit ctermbg=NONE ctermfg=242 guibg=NONE guifg=#7b7d7b
hi LineNr ctermfg=242 guifg=#7b7d7b
hi CursorLine guifg=NONE guibg=#3a3a3a gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
hi CursorColumn guifg=NONE guibg=#3a3a3a gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
hi Function guifg=#FFD2A7 guibg=NONE gui=NONE ctermfg=yellow ctermbg=NONE cterm=NONE
hi Visual guifg=NONE guibg=#262D51 gui=NONE ctermfg=NONE ctermbg=240 cterm=NONE

hi String guifg=#A8FF60 guibg=NONE gui=NONE ctermfg=green ctermbg=NONE cterm=NONE
hi Error guifg=NONE guibg=NONE gui=undercurl ctermfg=45 ctermbg=19 cterm=NONE term=NONE guisp=#FF6C60
hi ErrorMsg guifg=white guibg=#FF6C60 gui=BOLD ctermfg=16 ctermbg=red cterm=NONE
hi htmlError guifg=red gui=BOLD ctermfg=9 cterm=NONE
hi htmlItalic guibg=black ctermbg=0 gui=NONE cterm=NONE
hi WarningMsg guifg=white guibg=#FF6C60 gui=BOLD ctermfg=16 ctermbg=red cterm=NONE
hi SpellBad guifg=#FF6C60 guibg=black gui=underline ctermfg=160 ctermbg=0 cterm=underline
hi Search guifg=#000000 guibg=#87ff5f gui=BOLD ctermfg=16 ctermbg=119 cterm=NONE
hi Operator guifg=#6699CC guibg=#1D1E2C gui=NONE ctermfg=lightblue ctermbg=NONE cterm=NONE
hi Ignore guifg=gray guibg=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
hi qfLineNR guifg=#96CBFE guibg=NONE gui=NONE ctermfg=blue ctermbg=NONE cterm=NONE

hi ALEErrorSign guibg=NONE guifg=cyan ctermbg=NONE ctermfg=cyan
hi ALEWarningSign guibg=NONE guifg=lightgray ctermbg=NONE ctermfg=lightgray

hi DiffAdd term=reverse cterm=bold ctermbg=lightgreen ctermfg=16
hi DiffChange term=reverse cterm=bold ctermbg=lightblue ctermfg=16
hi DiffText term=reverse cterm=bold ctermbg=lightgray ctermfg=16
hi DiffDelete term=reverse cterm=bold ctermbg=lightred ctermfg=16

hi PmenuSel ctermfg=16 ctermbg=156

hi TabLineFill guibg=darkgray guifg=#171717 ctermbg=darkgray ctermfg=233
hi TabLineSel guibg=darkgray guifg=lightgreen ctermbg=236 ctermfg=120
hi TabLine guibg=black guifg=darkgray gui=NONE ctermbg=black ctermfg=darkgray cterm=NONE

hi EndOfBuffer guifg=#C6C5FE ctermfg=cyan
