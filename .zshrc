function dotfiles() {
  if [[ $# -eq 0 ]]
  then
    echo "$fg_no_bold[cyan]install:homebrew$reset_color  install homebrew"
    echo "$fg_no_bold[cyan]install:iosevka$reset_color   install iosevka font"
    echo "$fg_no_bold[cyan]install:plugin$reset_color    add a new vim plugin"
    echo "$fg_no_bold[cyan]install:plugins$reset_color   install all vim plugins"
    echo "$fg_no_bold[cyan]install:toolbox$reset_color   install usual homebrew tools"
    echo "$fg_no_bold[cyan]upload$reset_color            push changes to github"
    return
  fi

  case $1 in


  "install")
    /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/hencatsmith/dotfiles/trunk/install.sh)"
    ;;

  "install:homebrew")
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    ;;

  "install:iosevka")
    brew tap homebrew/cask-fonts
    brew cask install font-iosevka
    brew cask install font-iosevka-slab
    ;;

  "install:plugin")
    dotfiles submodule add -f $3 .vim/pack/plugins/start/$2
    dotfiles c $2
    dotfiles install:plugins
    ;;

  "install:plugins")
    rm -rf ~/.vim
    dotfiles checkout trunk -- ~/.vim
    dotfiles submodule update --init --recursive
    ;;

  "install:toolbox")
    brew install cowsay git sl tree tmux wget
    ;;

  "reinstall")
    dotfiles uninstall
    dotfiles install
    ;;

  "uninstall")
    for file in `dotfiles ls-files`; do
      rm -rf ~/$file;
    done
    rm -rf ~/.dotfiles
    ;;

  "upload")
    dotfiles push origin trunk
    ;;

  *)
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
    ;;
  esac
}

alias t='tree -L 1'

plugins=(git)

export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="sunrise"
source $HOME/.oh-my-zsh/oh-my-zsh.sh
export ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_no_bold[cyan]%}‹"
export ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_no_bold[cyan]%}›%{$RESET%} "

