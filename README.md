dotfiles
========

```bash
git clone --bare git@github.com:hencatsmith/dotfiles.git .dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME sparse-checkout init
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME sparse-checkout add .gitconfig
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME sparse-checkout add .vim
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME sparse-checkout add .vimrc
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME sparse-checkout add .zshrc
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout trunk -- .vim
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME submodule update --init --recursive
```

#### iTerm2

1. https://www.iterm2.com/
1. https://draculatheme.com/iterm/
1. https://medium.com/@jonnyhaynes/jump-forwards-backwards-and-delete-a-word-in-iterm2-on-mac-os-43821511f0a/

#### Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install cowsay git oh-my-zsh sl tree tmux wget
```

#### Iosevka

https://github.com/be5invis/Iosevka#installation

```bash
brew tap homebrew/cask-fonts && brew cask install font-iosevka && brew cask install font-iosevka-slab
```
