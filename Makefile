
ETC=$(shell pwd)

default:
	@echo "  install       Install all config files"
	@echo "  uninstall     Remove all config files"
	@echo "  vim-plugins   Download all required Vim plugins"

install: \
	~/.bashrc \
	~/.gitconfig \
	~/.vimrc

uninstall:
	rm -f $(HOME)/.bashrc
	rm -f $(HOME)/.gitconfig
	rm -f $(HOME)/.vimrc

vim-plugins: \
	vim/bundle/ctrl-p.vim \
	vim/bundle/solarized.vim

~/.bashrc:
	rm -f $(HOME)/.bashrc
	ln -s $(ETC)/bash/bashrc $(HOME)/.bashrc

~/.gitconfig:
	rm -f $(HOME)/.gitconfig
	ln -s $(ETC)/git/gitconfig $(HOME)/.gitconfig

~/.vimrc:
	echo "source $(ETC)/vim/vimrc" > "$(HOME)/.vimrc"

vim/bundle/ctrl-p.vim:
	git clone git://github.com/kien/ctrlp.vim.git vim/bundle/ctrl-p.vim

vim/bundle/solarized.vim:
	git clone https://github.com/altercation/vim-colors-solarized.git vim/bundle/solarized.vim

.PHONY: \
	default \
	install \
	uninstall \
	vim-plugins

