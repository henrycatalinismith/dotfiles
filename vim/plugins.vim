call plug#begin('~/.dotfiles/vim/plugins')
if expand("%:t") != "COMMIT_EDITMSG"
  Plug 'jistr/vim-nerdtree-tabs'
endif

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
let NERDTreeMouseMode=2

let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_autoclose = 0
let g:nerdtree_tabs_synchronize_view = 0
let g:nerdtree_tabs_autofind = 1

nnoremap <leader>t  :CtrlP<CR>

" https://github.com/gonzaloserrano/spf13-vim/commit/3f977d6e6e94125a850da5dda349b961e431f869
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
  \ },
  \ 'fallback': 'find %s -type f'
\ }
