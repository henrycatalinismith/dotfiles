for _zsh_syntax_highlighting in \
  "${HOMEBREW_PREFIX:+$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh}" \
  /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; do
  if [[ -n "$_zsh_syntax_highlighting" && -r "$_zsh_syntax_highlighting" ]]; then
    source "$_zsh_syntax_highlighting"
    break
  fi
done

unset _zsh_syntax_highlighting
