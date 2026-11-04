if (( $+commands[brew] )); then
  _zsh_syntax_highlighting="$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

  if [[ -r "$_zsh_syntax_highlighting" ]]; then
    source "$_zsh_syntax_highlighting"
  fi
fi

unset _zsh_syntax_highlighting
