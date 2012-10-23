

set errorformat=%m\ in\ %f\ on\ line\ %l
set keywordprg='help'
set makeprg=php\ -l\ %
set omnifunc=phpcomplete#CompletePHP


function! PhpPrint()
	execute "normal aecho '<pre>', print_r($, true), '</pre>';"
	exe 'norm' . 17 . 'h'
	startinsert
endfunction


nnoremap <leader>e :!php %<CR>
nnoremap <leader>d :call PhpPrint()<CR>

setlocal shiftwidth=4
setlocal tabstop=4


