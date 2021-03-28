#!/bin/zsh

function dotfiles() {
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

git clone --bare git@github.com:hendotcat/dotfiles.git .dotfiles
dotfiles config --local status.showUntrackedFiles no

dotfiles sparse-checkout init
dotfiles sparse-checkout set Library/Application\ Support/Code/User/settings.json
dotfiles sparse-checkout add .Brewfile
dotfiles sparse-checkout add .config/alacritty/alacritty.yml
dotfiles sparse-checkout add .config/coc/extensions/package.json
dotfiles sparse-checkout add .config/gem/gemrc
dotfiles sparse-checkout add .config/irb/irbrc
dotfiles sparse-checkout add .config/nvim/init.lua
dotfiles sparse-checkout add .config/nvim/lua/plugins.lua
dotfiles sparse-checkout add .config/nvim/coc-settings.json
dotfiles sparse-checkout add .config/rails/railsrc
dotfiles sparse-checkout add .config/tmux/plugins/tpm
dotfiles sparse-checkout add .config/tmux/tmux.conf
dotfiles sparse-checkout add .editorconfig
dotfiles sparse-checkout add .gitconfig
dotfiles sparse-checkout add .gitignore
dotfiles sparse-checkout add .gitmodules
dotfiles sparse-checkout add .nethackrc
dotfiles sparse-checkout add .zshrc
dotfiles checkout

dotfiles submodule update --init --recursive

