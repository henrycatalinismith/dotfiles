if (( $+commands[brew] )); then
  _zsh_autosuggestions="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

  if [[ -r "$_zsh_autosuggestions" ]]; then
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    source "$_zsh_autosuggestions"
  fi
fi

unset _zsh_autosuggestions
