" Hello
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "corporation_modified"

hi Normal guifg=#f69648 guibg=#002b36 guisp=#002b36 gui=NONE
hi IncSearch guifg=#192224 guibg=#BD9800 guisp=#BD9800 gui=NONE
hi WildMenu guifg=NONE guibg=#A1A6A8 guisp=#A1A6A8 gui=NONE
hi SignColumn guifg=#192224 guibg=#536991 guisp=#536991 gui=NONE
hi SpecialComment guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE
hi Typedef guifg=#536991 guibg=NONE guisp=NONE gui=bold
hi Title guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=bold
hi Folded guifg=#192224 guibg=#A1A6A8 guisp=#A1A6A8 gui=italic
hi PreCondit guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE
hi Include guifg=#00ffff guibg=NONE guisp=NONE gui=NONE
hi TabLineSel guifg=#192224 guibg=#BD9800 guisp=#BD9800 gui=bold
hi StatusLineNC guifg=#192224 guibg=#5E6C70 guisp=#5E6C70 gui=bold
hi NonText guifg=#5E6C70 guibg=NONE guisp=NONE gui=italic
hi DiffText guifg=NONE guibg=#492224 guisp=#492224 gui=NONE
hi ErrorMsg guifg=#A1A6A8 guibg=#912C00 guisp=#912C00 gui=NONE
hi Debug guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE
hi PMenuSbar guifg=NONE guibg=#848688 guisp=#848688 gui=NONE
hi Identifier guifg=#e05178 guibg=NONE guisp=NONE gui=NONE
hi jsModuleKeyword guifg=#e05178 guibg=NONE guisp=NONE gui=NONE
hi SpecialChar guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE
hi Conditional guifg=#BD9800 guibg=NONE guisp=NONE gui=bold
hi StorageClass guifg=#add877 guibg=NONE guisp=NONE gui=bold
hi Todo guifg=#F9F9FF guibg=#BD9800 guisp=#BD9800 gui=NONE
hi Special guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE
hi LineNr guifg=#f69648 guibg=NONE guisp=NONE gui=NONE
hi StatusLine guifg=#192224 guibg=#BD9800 guisp=#BD9800 gui=bold
hi Label guifg=#BD9800 guibg=NONE guisp=NONE gui=bold
hi PMenuSel guifg=#192224 guibg=#BD9800 guisp=#BD9800 gui=NONE
hi Search guifg=#192224 guibg=#BD9800 guisp=#BD9800 gui=NONE
hi Delimiter guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE
" hi Statement guifg=#f6f080 guibg=NONE guisp=NONE gui=bold
hi Statement guifg=#f69648 guibg=NONE guisp=NONE gui=bold
hi SpellRare guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline
hi Comment guifg=#e05178 guibg=NONE guisp=NONE gui=italic
hi Character guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE
hi Float guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE
hi Number guifg=#e05177 guibg=NONE guisp=NONE gui=NONE
hi Boolean guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE
hi Operator guifg=#BD9800 guibg=NONE guisp=NONE gui=bold
hi CursorLine guifg=NONE guibg=#222E30 guisp=#222E30 gui=NONE
hi TabLineFill guifg=#192224 guibg=#5E6C70 guisp=#5E6C70 gui=bold
hi WarningMsg guifg=#A1A6A8 guibg=#912C00 guisp=#912C00 gui=NONE
hi VisualNOS guifg=#192224 guibg=#F9F9FF guisp=#F9F9FF gui=underline
hi DiffDelete guifg=NONE guibg=#192224 guisp=#192224 gui=NONE
hi ModeMsg guifg=#F9F9F9 guibg=#192224 guisp=#192224 gui=bold
hi CursorColumn guifg=NONE guibg=#222E30 guisp=#222E30 gui=NONE
hi Define guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE
hi Function guifg=#e05178 guibg=NONE guisp=NONE gui=bold
hi jsFuncCall guifg=#e05178 guibg=NONE guisp=NONE gui=bold
hi FoldColumn guifg=#192224 guibg=#A1A6A8 guisp=#A1A6A8 gui=italic
hi PreProc guifg=#60a7ca guibg=NONE guisp=NONE gui=NONE
hi Visual guifg=#192224 guibg=#F9F9FF guisp=#F9F9FF gui=NONE
hi MoreMsg guifg=#BD9800 guibg=NONE guisp=NONE gui=bold
hi SpellCap guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline
hi VertSplit guifg=#192224 guibg=#5E6C70 guisp=#5E6C70 gui=bold
hi Exception guifg=#BD9800 guibg=NONE guisp=NONE gui=bold
hi Keyword guifg=#f69648 guibg=NONE guisp=NONE gui=bold
hi Type guifg=#acd877 guibg=NONE guisp=NONE gui=bold
hi DiffChange guifg=NONE guibg=#492224 guisp=#492224 gui=NONE
hi Cursor guifg=#192224 guibg=#F9F9F9 guisp=#F9F9F9 gui=NONE
hi SpellLocal guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline
hi Error guifg=#A1A6A8 guibg=#912C00 guisp=#912C00 gui=NONE
hi PMenu guifg=#192224 guibg=#5E6C70 guisp=#5E6C70 gui=NONE
hi SpecialKey guifg=#5E6C70 guibg=NONE guisp=NONE gui=italic
hi Constant guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE
hi Tag guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE
hi String guifg=#f6f080 guibg=NONE guisp=NONE gui=NONE
hi PMenuThumb guifg=NONE guibg=#a4a6a8 guisp=#a4a6a8 gui=NONE
hi MatchParen guifg=#BD9800 guibg=NONE guisp=NONE gui=bold
hi Repeat guifg=#BD9800 guibg=NONE guisp=NONE gui=bold
hi SpellBad guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline
hi Directory guifg=#536991 guibg=NONE guisp=NONE gui=bold
hi Structure guifg=#536991 guibg=NONE guisp=NONE gui=bold
hi Macro guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE
hi Underlined guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline
hi DiffAdd guifg=NONE guibg=#193224 guisp=#193224 gui=NONE
hi TabLine guifg=#192224 guibg=#5E6C70 guisp=#5E6C70 gui=bold
hi cursorim guifg=#192224 guibg=#536991 guisp=#536991 gui=NONE
