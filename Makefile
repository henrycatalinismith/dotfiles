
ETC=$(shell pwd)

default:
	@echo "  install       Install all config files"
	@echo "  clean         Remove all config files"

install: \
	~/.Xdefaults \
	~/.Xmodmap \
	~/.bashrc \
	~/.gitconfig \
	~/.nethackrc \
	~/.tmux.conf \
	~/.vimrc

clean:
	rm -f $(HOME)/.Xdefaults
	rm -f $(HOME)/.Xmodmap
	rm -f $(HOME)/.bashrc
	rm -f $(HOME)/.gitconfig
	rm -f $(HOME)/.nethackrc
	rm -f $(HOME)/.tmux.conf
	rm -f $(HOME)/.vimrc

~/.Xdefaults:
	rm -f $(HOME)/.Xdefaults
	ln -s $(ETC)/x11/Xdefaults $(HOME)/.Xdefaults

~/.Xmodmap:
	rm -f $(HOME)/.Xmodmap
	ln -s $(ETC)/x11/Xmodmap $(HOME)/.Xmodmap

~/.bashrc:
	rm -f $(HOME)/.bashrc
	ln -s $(ETC)/bash/bashrc $(HOME)/.bashrc

~/.gitconfig:
	rm -f $(HOME)/.gitconfig
	ln -s $(ETC)/git/gitconfig $(HOME)/.gitconfig

~/.nethackrc:
	rm -f $(HOME)/.nethackrc
	ln -s $(ETC)/nethack/nethackrc $(HOME)/.nethackrc

~/.tmux.conf:
	rm -f $(HOME)/.tmux.conf
	ln -s $(ETC)/tmux/tmux.conf $(HOME)/.tmux.conf

~/.vimrc:
	echo "source $(ETC)/vim/vimrc" > "$(HOME)/.vimrc"

.PHONY: clean default install

