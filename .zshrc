alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

plugins=(git)

export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="sunrise"
source $HOME/.oh-my-zsh/oh-my-zsh.sh
export ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_no_bold[cyan]%}‹"
export ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_no_bold[cyan]%}›%{$RESET%} "

