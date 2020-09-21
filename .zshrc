function dotfiles() {
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

function dofi() {
  case $1 in
  "addplugin")
    echo "[submodule \".vim/pack/plugins/start/$2\"]" >> ~/.gitmodules
    echo "\tpath = .vim/pack/plugins/start/$2"        >> ~/.gitmodules
    echo "\turl = $3"                                 >> ~/.gitmodules
    dofi c $2
    dofi plugins
    ;;

  "plugins")
    dofi checkout trunk -- ~/.vim
    dofi submodule update --init --recursive
    ;;

  *)
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
    ;;
  esac
}

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias t='tree -L 1'

plugins=(git)

export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="sunrise"
source $HOME/.oh-my-zsh/oh-my-zsh.sh
export ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_no_bold[cyan]%}‹"
export ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_no_bold[cyan]%}›%{$RESET%} "

