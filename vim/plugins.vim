call plug#begin('~/.dotfiles/vim/plugins')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx'
Plug 'jistr/vim-nerdtree-tabs'
call plug#end()

let g:gitgutter_realtime = 1
let NERDTreeMinimalUI=1

let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_autoclose = 0

nnoremap <leader>t  :CtrlP<CR>
