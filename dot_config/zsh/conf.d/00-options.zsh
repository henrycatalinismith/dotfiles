bindkey -e
WORDCHARS=${WORDCHARS//[\/\-_.]}
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word
bindkey '^[b' backward-word
bindkey '^[f' forward-word
bindkey '^[^?' backward-kill-word

setopt autocd
setopt prompt_subst
setopt interactive_comments

setopt append_history
setopt inc_append_history
setopt share_history

HISTFILE="$HOME/.config/zsh/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
