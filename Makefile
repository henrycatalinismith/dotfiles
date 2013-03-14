
ETC=$(shell pwd)

default:
	@echo "  install       Install all config files"
	@echo "  uninstall     Remove all config files"

install: \
	~/.gitconfig \
	~/.vimrc

uninstall:
	rm -f $(HOME)/.gitconfig
	rm -f $(HOME)/.vimrc

~/.gitconfig:
	rm -f $(HOME)/.gitconfig
	ln -s $(ETC)/git/gitconfig $(HOME)/.gitconfig

~/.vimrc:
	echo "source $(ETC)/vim/vimrc" > "$(HOME)/.vimrc"

.PHONY: \
	default \
	install \
	uninstall

