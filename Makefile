BLACK=\#1f1a1b
BRIGHT_BLACK=\#4b4b4b
RED=\#dc322f
BRIGHT_RED=\#DC776B
GREEN=\#C0D14E
BRIGHT_GREEN=\#bde18b
YELLOW=\#B58900
BRIGHT_YELLOW=\#EBC348
YELLOW=\#dbd560
BRIGHT_YELLOW=\#fffeb2
BLUE=\#268bd2
BRIGHT_BLUE=\#6FB2E2
MAGENTA=\#a073d6
BRIGHT_MAGENTA=\#df56cc
CYAN=\#1FC2C2
BRIGHT_CYAN=\#67D8D8
WHITE=\#d0d0d0
BRIGHT_WHITE=\#ffffff

DOTFILES=~/.dotfiles

colors: vim/colors/default.vim
	sed -i.bak "s/black:.*/black: '${BLACK}',/g" hyper/hyper.js
	sed -i.bak "s/red:.*/red: '${RED}',/g" hyper/hyper.js
	sed -i.bak "s/green:.*/green: '${GREEN}',/g" hyper/hyper.js
	sed -i.bak "s/yellow:.*/yellow: '${YELLOW}',/g" hyper/hyper.js
	sed -i.bak "s/blue:.*/blue: '${BLUE}',/g" hyper/hyper.js
	sed -i.bak "s/magenta:.*/magenta: '${MAGENTA}',/g" hyper/hyper.js
	sed -i.bak "s/cyan:.*/cyan: '${CYAN}',/g" hyper/hyper.js
	sed -i.bak "s/white:.*/white: '${WHITE}',/g" hyper/hyper.js
	sed -i.bak "s/brightBlack:.*/brightBlack: '${BRIGHT_BLACK}',/g" hyper/hyper.js
	sed -i.bak "s/brightRed:.*/brightRed: '${BRIGHT_RED}',/g" hyper/hyper.js
	sed -i.bak "s/brightGreen:.*/brightGreen: '${BRIGHT_GREEN}',/g" hyper/hyper.js
	sed -i.bak "s/brightYellow:.*/brightYellow: '${BRIGHT_YELLOW}',/g" hyper/hyper.js
	sed -i.bak "s/brightBlue:.*/brightBlue: '${BRIGHT_BLUE}',/g" hyper/hyper.js
	sed -i.bak "s/brightMagenta:.*/brightMagenta: '${BRIGHT_MAGENTA}',/g" hyper/hyper.js
	sed -i.bak "s/brightCyan:.*/brightCyan: '${BRIGHT_CYAN}',/g" hyper/hyper.js
	sed -i.bak "s/brightWhite:.*/brightWhite: '${BRIGHT_WHITE}',/g" hyper/hyper.js
	rm hyper/hyper.js.bak

vim/colors/default.vim:
	cp vim/colors.vim vim/colors/default.vim
	sed -i.bak 's/ctermfg=:BLACK:/ctermfg=0/g' vim/colors/default.vim
	sed -i.bak 's/ctermfg=:RED:/ctermfg=1/g' vim/colors/default.vim
	sed -i.bak 's/ctermfg=:GREEN:/ctermfg=2/g' vim/colors/default.vim
	sed -i.bak 's/ctermfg=:YELLOW:/ctermfg=3/g' vim/colors/default.vim
	sed -i.bak 's/ctermfg=:BLUE:/ctermfg=4/g' vim/colors/default.vim
	sed -i.bak 's/ctermfg=:MAGENTA:/ctermfg=5/g' vim/colors/default.vim
	sed -i.bak 's/ctermfg=:CYAN:/ctermfg=6/g' vim/colors/default.vim
	sed -i.bak 's/ctermfg=:WHITE:/ctermfg=7/g' vim/colors/default.vim
	sed -i.bak 's/ctermfg=:BRIGHT_BLACK:/ctermfg=8/g' vim/colors/default.vim
	sed -i.bak 's/ctermfg=:BRIGHT_RED:/ctermfg=9/g' vim/colors/default.vim
	sed -i.bak 's/ctermfg=:BRIGHT_GREEN:/ctermfg=10/g' vim/colors/default.vim
	sed -i.bak 's/ctermfg=:BRIGHT_YELLOW:/ctermfg=11/g' vim/colors/default.vim
	sed -i.bak 's/ctermfg=:BRIGHT_BLUE:/ctermfg=12/g' vim/colors/default.vim
	sed -i.bak 's/ctermfg=:BRIGHT_MAGENTA:/ctermfg=13/g' vim/colors/default.vim
	sed -i.bak 's/ctermfg=:BRIGHT_CYAN:/ctermfg=14/g' vim/colors/default.vim
	sed -i.bak 's/ctermfg=:BRIGHT_WHITE:/ctermfg=15/g' vim/colors/default.vim
	sed -i.bak 's/ctermbg=:BLACK:/ctermbg=0/g' vim/colors/default.vim
	sed -i.bak 's/ctermbg=:RED:/ctermbg=1/g' vim/colors/default.vim
	sed -i.bak 's/ctermbg=:GREEN:/ctermbg=2/g' vim/colors/default.vim
	sed -i.bak 's/ctermbg=:YELLOW:/ctermbg=3/g' vim/colors/default.vim
	sed -i.bak 's/ctermbg=:BLUE:/ctermbg=4/g' vim/colors/default.vim
	sed -i.bak 's/ctermbg=:MAGENTA:/ctermbg=5/g' vim/colors/default.vim
	sed -i.bak 's/ctermbg=:CYAN:/ctermbg=6/g' vim/colors/default.vim
	sed -i.bak 's/ctermbg=:WHITE:/ctermbg=7/g' vim/colors/default.vim
	sed -i.bak 's/ctermbg=:BRIGHT_BLACK:/ctermbg=8/g' vim/colors/default.vim
	sed -i.bak 's/ctermbg=:BRIGHT_RED:/ctermbg=9/g' vim/colors/default.vim
	sed -i.bak 's/ctermbg=:BRIGHT_GREEN:/ctermbg=10/g' vim/colors/default.vim
	sed -i.bak 's/ctermbg=:BRIGHT_YELLOW:/ctermbg=11/g' vim/colors/default.vim
	sed -i.bak 's/ctermbg=:BRIGHT_BLUE:/ctermbg=12/g' vim/colors/default.vim
	sed -i.bak 's/ctermbg=:BRIGHT_MAGENTA:/ctermbg=13/g' vim/colors/default.vim
	sed -i.bak 's/ctermbg=:BRIGHT_CYAN:/ctermbg=14/g' vim/colors/default.vim
	sed -i.bak 's/ctermbg=:BRIGHT_WHITE:/ctermbg=15/g' vim/colors/default.vim
	sed -i.bak "s/:BLACK:/${BLACK}/g" vim/colors/default.vim
	sed -i.bak "s/:RED:/${RED}/g" vim/colors/default.vim
	sed -i.bak "s/:GREEN:/${GREEN}/g" vim/colors/default.vim
	sed -i.bak "s/:YELLOW:/${YELLOW}/g" vim/colors/default.vim
	sed -i.bak "s/:BLUE:/${BLUE}/g" vim/colors/default.vim
	sed -i.bak "s/:MAGENTA:/${MAGENTA}/g" vim/colors/default.vim
	sed -i.bak "s/:CYAN:/${CYAN}/g" vim/colors/default.vim
	sed -i.bak "s/:WHITE:/${WHITE}/g" vim/colors/default.vim
	sed -i.bak "s/:BRIGHT_BLACK:/${BRIGHT_BLACK}/g" vim/colors/default.vim
	sed -i.bak "s/:BRIGHT_RED:/${BRIGHT_RED}/g" vim/colors/default.vim
	sed -i.bak "s/:BRIGHT_GREEN:/${BRIGHT_GREEN}/g" vim/colors/default.vim
	sed -i.bak "s/:BRIGHT_YELLOW:/${BRIGHT_YELLOW}/g" vim/colors/default.vim
	sed -i.bak "s/:BRIGHT_BLUE:/${BRIGHT_BLUE}/g" vim/colors/default.vim
	sed -i.bak "s/:BRIGHT_MAGENTA:/${BRIGHT_MAGENTA}/g" vim/colors/default.vim
	sed -i.bak "s/:BRIGHT_CYAN:/${BRIGHT_CYAN}/g" vim/colors/default.vim
	sed -i.bak "s/:BRIGHT_WHITE:/${BRIGHT_WHITE}/g" vim/colors/default.vim
	rm vim/colors/default.vim.bak

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

.PHONY: clean default install uninstall vim/colors/default.vim hyper/colors.js colors
