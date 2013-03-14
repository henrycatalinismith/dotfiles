
let local_vimrc = expand("~") . "/local/etc/vim/vimrc"
if filereadable(local_vimrc)
	exec ":source" . local_vimrc
endif

