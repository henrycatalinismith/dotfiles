
ETC=$(shell pwd)

default:
	@echo "  install       Install all config files"
	@echo "  uninstall     Remove all config files"
	@echo "  vim-plugins   Download all required Vim plugins"
	@echo "  clean         Delete all untracked files"
	@echo "  update        Update Vim plugins"

clean:
	rm -rf vim/bundle/coffee-script.vim
	rm -rf vim/bundle/ctrlp.vim
	rm -rf vim/bundle/fugitive.vim
	rm -rf vim/bundle/nerdtree.vim
	rm -rf vim/bundle/powerline.vim
	rm -rf vim/bundle/solarized.vim
	rm -rf vim/bundle/surround.vim
	rm -rf vim/bundle/tabular.vim
	rm -rf vim/bundle/twig.vim

install: ~/.Xmodmap   \
	~/.bashrc    \
	~/.emacs     \
	~/.gitconfig \
	~/.nethackrc \
	~/.pplconfig \
	~/.tmux.conf \
	~/.vimrc

uninstall:
	rm -f $(HOME)/.Xmodmap
	rm -f $(HOME)/.bashrc
	rm -f $(HOME)/.emacs
	rm -f $(HOME)/.gitconfig
	rm -f $(HOME)/.nethackrc
	rm -f $(HOME)/.pplconfig
	rm -f $(HOME)/.tmux.conf
	rm -f $(HOME)/.vimrc

vim-plugins: \
	vim/bundle/coffee-script.vim \
	vim/bundle/ctrlp.vim \
	vim/bundle/fugitive.vim \
	vim/bundle/nerdtree.vim \
	vim/bundle/powerline.vim \
	vim/bundle/solarized.vim \
	vim/bundle/surround.vim \
	vim/bundle/tabular.vim \
	vim/bundle/twig.vim

update: vim-plugins
	cd vim/bundle/ctrlp.vim     ; git pull origin master
	cd vim/bundle/fugitive.vim  ; git pull origin master
	cd vim/bundle/nerdtree.vim  ; git pull origin master
	cd vim/bundle/powerline.vim ; git pull origin master
	cd vim/bundle/solarized.vim ; git pull origin master
	cd vim/bundle/surround.vim  ; git pull origin master
	cd vim/bundle/tabular.vim   ; git pull origin master

~/.Xmodmap:
	ln -s $(ETC)/x11/Xmodmap $(HOME)/.Xmodmap

~/.bashrc:
	ln -s $(ETC)/bash/bashrc $(HOME)/.bashrc

~/.emacs:
	ln -s $(ETC)/emacs/emacs $(HOME)/.emacs

~/.gitconfig:
	ln -s $(ETC)/git/gitconfig $(HOME)/.gitconfig

~/.nethackrc:
	ln -s $(ETC)/nethack/nethackrc $(HOME)/.nethackrc

~/.pplconfig:
	ln -s $(ETC)/ppl/pplconfig $(HOME)/.pplconfig

~/.tmux.conf:
	ln -s $(ETC)/tmux/tmux.conf $(HOME)/.tmux.conf

~/.vimrc:
	echo "source $(ETC)/vim/vimrc" > "$(HOME)/.vimrc"

vim/bundle/coffee-script.vim:
	git clone git@github.com:kchmck/vim-coffee-script.git vim/bundle/coffee-script.vim

vim/bundle/ctrlp.vim:
	git clone https://github.com/kien/ctrlp.vim.git vim/bundle/ctrlp.vim

vim/bundle/fugitive.vim:
	git clone https://github.com/tpope/vim-fugitive.git vim/bundle/fugitive.vim

vim/bundle/nerdtree.vim:
	git clone https://github.com/scrooloose/nerdtree.git vim/bundle/nerdtree.vim

vim/bundle/powerline.vim:
	git clone https://github.com/Lokaltog/vim-powerline.git vim/bundle/powerline.vim

vim/bundle/solarized.vim:
	git clone https://github.com/altercation/vim-colors-solarized.git vim/bundle/solarized.vim

vim/bundle/surround.vim:
	git clone https://github.com/tpope/vim-surround.git vim/bundle/surround.vim

vim/bundle/tabular.vim:
	git clone https://github.com/godlygeek/tabular.git vim/bundle/tabular.vim

vim/bundle/twig.vim:
	git clone https://github.com/lunaru/vim-twig.git vim/bundle/twig.vim

.PHONY: \
	clean \
	default \
	install \
	uninstall \
	update \
	vim-plugins

