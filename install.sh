#!/bin/zsh

function dotfiles() {
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

git clone --bare git@github.com:hencatsmith/dotfiles.git .dotfiles
dotfiles config --local status.showUntrackedFiles no

dotfiles sparse-checkout init
dotfiles sparse-checkout set .gitconfig
dotfiles sparse-checkout add .gitignore
dotfiles sparse-checkout add .gitmodules
dotfiles sparse-checkout add .nethackrc
dotfiles sparse-checkout add .vim
dotfiles sparse-checkout add .vimrc
dotfiles sparse-checkout add .zshrc
dotfiles checkout

dotfiles checkout trunk -- .vim
dotfiles submodule update --init --recursive

