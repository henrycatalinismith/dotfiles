colorscheme default
filetype indent plugin on
inoremap <F1> <nop>
map <Space> <Leader>
map Q <nop>
map Y y$
nnoremap <leader>p  :CtrlP<CR>
nnoremap <leader>q  :quit!<CR>
nnoremap <leader>w  :write<CR>
nnoremap <leader>wq :write<CR>:quit!<CR>
nnoremap <silent> # #zz
nnoremap <silent> * *zz
nnoremap <silent> N Nzz
nnoremap <silent> g# g#zz
nnoremap <silent> g* g*zz
nnoremap <silent> n nzz
noremap  <F1> <nop>
set autoindent
set background=dark
set backspace=2
set encoding=utf-8
set fileformat=unix
set ignorecase
set incsearch
set laststatus=2
set nobackup
set nocompatible
set noerrorbells
set nofoldenable
set noswapfile
set novisualbell
set nowrap
set number
set shortmess+=I
set showtabline=2
set smartindent
set synmaxcol=256
set t_Co=256
set textwidth=80
set wildignore+=*.DS_Store
set wildignore+=*.bmp
set wildignore+=*.gif
set wildignore+=*.jpeg
set wildignore+=*.jpg
set wildignore+=*.png
set wildignore+=*.swf
set wildignore+=.git
set wildignore+=.svn
set wildmenu
syntax on
syntax sync minlines=256
vnoremap < <gv
vnoremap > >gv
