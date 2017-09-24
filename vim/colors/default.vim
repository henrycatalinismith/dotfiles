highlight Normal guibg=#1f1a1b guifg=#d0d0d0
highlight LineNr guibg=#1f1a1b guifg=#4b4b4b ctermbg=0 ctermfg=8
highlight EndOfBuffer guifg=#1f1a1b ctermfg=0
highlight ColorColumn guibg=#a073d6 ctermbg=5

highlight VertSplit guibg=#1f1a1b ctermfg=0
highlight StatusLine guibg=#4b4b4b guifg=#d0d0d0 ctermbg=7 ctermfg=8
highlight StatusLineNC guibg=#4b4b4b guifg=#d0d0d0 ctermbg=7 ctermfg=8

highlight vimHiCtermError guibg=#1f1a1b guifg=#268bd2 ctermbg=0 ctermfg=4

highlight ExtraWhitespace guibg=#ffffff ctermbg=15

highlight Statement guifg=#C0D14E gui=none ctermfg=2
highlight Type guifg=#6FB2E2 gui=none ctermfg=12
highlight PreProc guifg=#6FB2E2 ctermfg=12
highlight Constant guifg=#C0D14E ctermfg=2

augroup NerdCursor
  autocmd!
  autocmd BufEnter NERD_tree_* highlight CursorLine guibg=#df56cc guifg=#ffffff ctermbg=13 cterm=none ctermfg=15
  autocmd BufLeave NERD_tree_* highlight CursorLine guibg=#4b4b4b ctermbg=8 cterm=none
  autocmd BufAdd * highlight clear CursorLine
augroup END

highlight NERDTreeCWD guifg=#df56cc ctermfg=13
highlight NERDTreeOpenable guifg=#268bd2 ctermfg=4
highlight NERDTreeDir guifg=#268bd2 ctermfg=4

highlight TabLineFill guifg=#4b4b4b ctermfg=8
highlight TabLineSel guibg=#df56cc guifg=#ffffff ctermbg=13 ctermfg=15
highlight TabLine guibg=#4b4b4b gui=bold ctermbg=8 cterm=bold

highlight Function guifg=#a073d6 ctermfg=5

highlight String guifg=#67D8D8 ctermfg=14

highlight jsModuleKeyword guifg=#bde18b ctermfg=10
highlight jsObjectKey guifg=#df56cc ctermfg=13
highlight jsClassKeyword guifg=#6FB2E2 ctermfg=12
highlight jsExtendsKeyword guifg=#6FB2E2 ctermfg=12
highlight jsClassDefinition guifg=#bde18b ctermfg=10
highlight jsFuncCall guifg=#df56cc ctermfg=13
highlight jsParen guifg=#bde18b ctermfg=10
highlight jsBracket guifg=#bde18b ctermfg=10
highlight jsBlock guifg=#bde18b ctermfg=10
highlight jsThis guifg=#bde18b ctermfg=10
highlight jsObjectProp guifg=#bde18b ctermfg=10
highlight jsObjectValue guifg=#bde18b ctermfg=10
highlight jsVariableDef guifg=#bde18b ctermfg=10

