#!/bin/sh


cd `dirname $0`
ETC=`pwd`


install_file() {

	HOME_VERSION="$HOME/$1"
	ETC_VERSION="$ETC/$2"

	if [ -f $HOME_VERSION ]; then
		rm $HOME_VERSION
	fi

	ln -s $ETC_VERSION $HOME_VERSION

}

install_file '.bashrc'    'bash/bashrc'
install_file '.Xdefaults' 'x11/Xdefaults'
install_file '.Xmodmap'   'x11/Xmodmap'
install_file '.i3'        'i3'
install_file '.gitconfig' 'git/gitconfig'
install_file '.tmux.conf' 'tmux/tmux.conf'
install_file '.nethackrc' 'nethack/nethackrc'

echo "source $ETC/vim/vimrc" > "$HOME/.vimrc"
echo "source $ETC/mutt/muttrc" > "$HOME/.muttrc"

rm $ETC/i3/i3

mkdir $ETC/vim/bundle
cd $ETC/vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/wincent/Command-T.git
git clone https://github.com/godlygeek/tabular.git
git clone https://github.com/vim-scripts/vcscommand.vim.git
git clone https://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/vim-scripts/PDV--phpDocumentor-for-Vim.git
git clone https://github.com/sjl/gundo.vim.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/Lokaltog/vim-powerline.git

