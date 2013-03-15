
setlocal omnifunc=phpcomplete#CompletePHP
setlocal shiftwidth=4
setlocal tabstop=4
setlocal expandtab

function! PhpPrint()
	execute "normal aecho '<pre>', print_r($, true), '</pre>';"
	exe 'norm' . 17 . 'h'
	startinsert
endfunction
nnoremap <leader>d :call PhpPrint()<CR>

