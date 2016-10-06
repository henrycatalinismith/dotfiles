DOTFILES=~/.dotfiles

default:
	@echo "  install       Install all config files"
	@echo "  uninstall     Remove all config files"

clean:
	rm -rf vim/colors

install: \
	~/.gitconfig \
	~/.hyper.js \
	~/.vimrc \
	vim/colors

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

vim/colors:
	git clone https://github.com/altercation/vim-colors-solarized.git
	mv vim-colors-solarized/colors vim/colors
	rm -rf vim-colors-solarized

.PHONY: \
	clean \
	default \
	install \
	uninstall

