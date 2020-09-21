function dotfiles() {
  case $1 in
  "addplugin")
    dotfiles submodule add -f $3 .vim/pack/plugins/start/$2
    dotfiles c $2
    dotfiles plugins
    ;;

  "plugins")
    rm -rf ~/.vim
    dotfiles checkout trunk -- ~/.vim
    dotfiles submodule update --init --recursive
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

