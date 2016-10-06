DOTFILES=~/.dotfiles

default:
	@echo "  install       Install all config files"
	@echo "  uninstall     Remove all config files"


install: \
	~/.gitconfig \
	~/.hyper.js \
	~/.vimrc \

uninstall:
	rm -f $(HOME)/.gitconfig
	rm -f $(HOME)/.hyper.js
	rm -f $(HOME)/.vimrc

~/.gitconfig:
	ln -s $(DOTFILES)/git/gitconfig $(HOME)/.gitconfig

~/.hyper.js:
	ln -s $(DOTFILES)/hyper/hyper.js $(HOME)/.hyper.js

~/.vimrc:
	ln -s $(DOTFILES)/vim/vimrc $(HOME)/.vimrc

.PHONY: \
	default \
	install \
	uninstall

