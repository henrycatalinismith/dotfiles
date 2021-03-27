#!/bin/zsh

function dotfiles() {
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

git clone --bare git@github.com:hendotcat/dotfiles.git .dotfiles
dotfiles config --local status.showUntrackedFiles no

dotfiles sparse-checkout init
dotfiles sparse-checkout set Library/Application\ Support/Code/User/settings.json
dotfiles sparse-checkout add .Brewfile
dotfiles sparse-checkout add .alacritty.yml
dotfiles sparse-checkout add .config/nvim/init.lua
dotfiles sparse-checkout add .config/nvim/lua/plugins.lua
dotfiles sparse-checkout add .gemrc
dotfiles sparse-checkout add .gitconfig
dotfiles sparse-checkout add .gitignore
dotfiles sparse-checkout add .gitmodules
dotfiles sparse-checkout add .irbrc
dotfiles sparse-checkout add .nethackrc
dotfiles sparse-checkout add .railsrc
dotfiles sparse-checkout add .tmux
dotfiles sparse-checkout add .tmux.conf
dotfiles sparse-checkout add .zshrc
dotfiles checkout

dotfiles submodule update --init --recursive

