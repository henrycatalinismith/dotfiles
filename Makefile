DOTFILES=~/.dotfiles

default:
	@echo "  install       Install all dotfiles"
	@echo "  uninstall     Remove all dotfiles"

clean:
	rm -f vim/autoload/plug.vim

install: ~/.gitconfig ~/.gvimrc ~/.hyper.js ~/.vimrc vim/autoload/plug.vim

uninstall:
	rm -f $(HOME)/.gitconfig
	rm -f $(HOME)/.gvimrc
	rm -f $(HOME)/.hyper.js
	rm -f $(HOME)/.vimrc

~/.gitconfig:
	ln -s $(DOTFILES)/git/gitconfig $(HOME)/.gitconfig

~/.gvimrc:
	ln -s $(DOTFILES)/vim/gvimrc $(HOME)/.gvimrc

~/.hyper.js:
	ln -s $(DOTFILES)/hyper/hyper.js $(HOME)/.hyper.js

~/.vimrc:
	ln -s $(DOTFILES)/vim/vimrc $(HOME)/.vimrc

vim/autoload/plug.vim:
	curl -fLo \
		vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.PHONY: clean default install uninstall
