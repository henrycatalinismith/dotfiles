if empty(glob("~/.local/share/nvim/site/pack/packer/start/packer.nvim"))
  silent !git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
endif

let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
  \ },
  \ 'fallback': 'find %s -type f'
\ }

let g:nvim_tree_width = 32

set number
set showtabline=2
set signcolumn=yes
set termguicolors

map <Space> <Leader>
nnoremap <leader>p  :CtrlP<CR>
nnoremap <leader>q  :quit!<CR>
nnoremap <leader>t  :NvimTreeToggle<CR>
nnoremap <leader>w  :write<CR>
nnoremap <leader>wq :write<CR>:quit!<CR>

hi LineNr       guifg=#83769C
hi Pmenu        guibg=#f8f8f2 guifg=#282a36
hi PmenuSbar    guibg=#44475a
hi PmenuSel     guibg=#6272a4
hi SignColumn   guibg=#21222C
hi TabLine      guifg=#ffffff  guibg=NONE
hi TabLineFill  guifg=#282b36
hi TabLineSel   guifg=#000000  guibg=#bd93f9

hi CocErrorFloat guibg=#ff5555

