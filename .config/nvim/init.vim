if empty(glob("~/.config/nvim/autoload/plug.vim"))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
  \ },
  \ 'fallback': 'find %s -type f'
\ }

let g:nvim_tree_width = 32

call plug#begin("~/.config/nvim/plugged")
Plug 'editorconfig/editorconfig-vim'
Plug 'kien/ctrlp.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mkitt/tabline.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'sheerun/vim-polyglot'
call plug#end()

map <Space> <Leader>
nnoremap <leader>p  :CtrlP<CR>
nnoremap <leader>q  :quit!<CR>
nnoremap <leader>t  :NvimTreeToggle<CR>
nnoremap <leader>w  :write<CR>
nnoremap <leader>wq :write<CR>:quit!<CR>

hi TabLine      ctermfg=White  ctermbg=NONE  cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=NONE  cterm=NONE
hi TabLineSel   ctermfg=Black  ctermbg=DarkMagenta  cterm=NONE

set number
set showtabline=2

