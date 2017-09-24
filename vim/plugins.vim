call plug#begin('~/.dotfiles/vim/plugins')
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx'
call plug#end()

let g:gitgutter_realtime = 1
let NERDTreeMinimalUI=1

let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_autoclose = 0
let g:nerdtree_tabs_synchronize_view = 0
let g:nerdtree_tabs_autofind = 1

nnoremap <leader>t  :CtrlP<CR>
