highlight Normal guibg=:BLACK: guifg=:WHITE:
highlight LineNr guibg=:BLACK: guifg=:BRIGHT_BLACK: ctermbg=:BLACK: ctermfg=:BRIGHT_BLACK:
highlight EndOfBuffer guifg=:BLACK: ctermfg=:BLACK:
highlight ColorColumn guibg=:MAGENTA: ctermbg=:MAGENTA:

highlight VertSplit guibg=:BLACK: ctermfg=:BLACK:
highlight StatusLine guibg=:BRIGHT_BLACK: guifg=:WHITE: ctermbg=:WHITE: ctermfg=:BRIGHT_BLACK:
highlight StatusLineNC guibg=:BLACK: guifg=:WHITE: ctermbg=:WHITE: ctermfg=:BLACK:

highlight vimHiCtermError guibg=:BLACK: guifg=:BLUE: ctermbg=:BLACK: ctermfg=:BLUE:

highlight ExtraWhitespace guibg=:BRIGHT_WHITE: ctermbg=:BRIGHT_WHITE:

highlight Statement guifg=:GREEN: gui=none ctermfg=:GREEN:
highlight Type guifg=:BRIGHT_BLUE: gui=none ctermfg=:BRIGHT_BLUE:
highlight PreProc guifg=:BRIGHT_BLUE: ctermfg=:BRIGHT_BLUE:
highlight Constant guifg=:GREEN: ctermfg=:GREEN:
highlight Boolean guifg=:MAGENTA: ctermfg=:MAGENTA:

augroup NerdCursor
  "autocmd!
  "autocmd BufEnter NERD_tree_* highlight CursorLine guibg=:BRIGHT_MAGENTA: guifg=:BRIGHT_WHITE: ctermbg=:BRIGHT_MAGENTA: cterm=none ctermfg=:BRIGHT_WHITE:
  "autocmd BufLeave NERD_tree_* highlight CursorLine guibg=:BRIGHT_BLACK: ctermbg=:BRIGHT_BLACK: cterm=none
  "autocmd BufAdd * highlight clear CursorLine
augroup END
highlight CursorLine guibg=:x235_Grey15: ctermbg=:x235_Grey15: cterm=none

highlight NERDTreeCWD guifg=:BRIGHT_MAGENTA: ctermfg=:BRIGHT_MAGENTA:
highlight NERDTreeOpenable guifg=:BLUE: ctermfg=:BLUE:
highlight NERDTreeDir guifg=:BLUE: ctermfg=:BLUE:

highlight TabLineFill guifg=:BRIGHT_BLACK: ctermfg=:BRIGHT_BLACK:
highlight TabLineSel guibg=:BRIGHT_MAGENTA: guifg=:BRIGHT_WHITE: ctermbg=:BRIGHT_MAGENTA: ctermfg=:BRIGHT_WHITE:
highlight TabLine guibg=:BRIGHT_BLACK: gui=bold ctermbg=:BRIGHT_BLACK: cterm=bold

highlight Function guifg=:MAGENTA: ctermfg=:MAGENTA:

highlight String guifg=:BRIGHT_CYAN: ctermfg=:BRIGHT_CYAN:

highlight jsModuleKeyword guifg=:BRIGHT_GREEN: ctermfg=:BRIGHT_GREEN:
highlight jsObjectKey guifg=:BRIGHT_MAGENTA: ctermfg=:BRIGHT_MAGENTA:
highlight jsClassKeyword guifg=:BRIGHT_BLUE: ctermfg=:BRIGHT_BLUE:
highlight jsExtendsKeyword guifg=:BRIGHT_BLUE: ctermfg=:BRIGHT_BLUE:
highlight jsClassDefinition guifg=:BRIGHT_GREEN: ctermfg=:BRIGHT_GREEN:
highlight jsFuncCall guifg=:BRIGHT_MAGENTA: ctermfg=:BRIGHT_MAGENTA:
highlight jsParen guifg=:BRIGHT_GREEN: ctermfg=:BRIGHT_GREEN:
highlight jsBracket guifg=:BRIGHT_GREEN: ctermfg=:BRIGHT_GREEN:
highlight jsBlock guifg=:BRIGHT_GREEN: ctermfg=:BRIGHT_GREEN:
highlight jsThis guifg=:BRIGHT_GREEN: ctermfg=:BRIGHT_GREEN:
highlight jsObjectProp guifg=:BRIGHT_GREEN: ctermfg=:BRIGHT_GREEN:
highlight jsObjectValue guifg=:BRIGHT_GREEN: ctermfg=:BRIGHT_GREEN:
highlight jsVariableDef guifg=:BRIGHT_GREEN: ctermfg=:BRIGHT_GREEN:

