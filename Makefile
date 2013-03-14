
ETC=$(shell pwd)

default:
	@echo "  install       Install all config files"
	@echo "  uninstall     Remove all config files"
	@echo "  vim-plugins   Download all required Vim plugins"

install: \
	~/.Xmodmap \
	~/.bashrc \
	~/.gitconfig \
	~/.tmux.conf \
	~/.vimrc

uninstall:
	rm -f $(HOME)/.Xmodmap
	rm -f $(HOME)/.bashrc
	rm -f $(HOME)/.gitconfig
	rm -f $(HOME)/.tmux.conf
	rm -f $(HOME)/.vimrc

vim-plugins: \
	vim/bundle/ctrl-p.vim \
	vim/bundle/solarized.vim

~/.Xmodmap:
	ln -s $(ETC)/x11/Xmodmap $(HOME)/.Xmodmap

~/.bashrc:
	ln -s $(ETC)/bash/bashrc $(HOME)/.bashrc

~/.gitconfig:
	ln -s $(ETC)/git/gitconfig $(HOME)/.gitconfig

~/.tmux.conf:
	ln -s $(ETC)/tmux/tmux.conf $(HOME)/.tmux.conf

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

