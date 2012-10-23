

" Swaps tab size between 4 and 8 because sometimes I have to work with code
" written by people who use their non-standard 4 space tabs for aligning things
function! InvertTabstop()
	if &tabstop == 8
		set tabstop=4
	else
		set tabstop=8
	endif
endfunction


