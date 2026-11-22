for _zsh_autosuggestions in \
  "${HOMEBREW_PREFIX:+$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh}" \
  /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh; do
  if [[ -n "$_zsh_autosuggestions" && -r "$_zsh_autosuggestions" ]]; then
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    source "$_zsh_autosuggestions"
    break
  fi
done

unset _zsh_autosuggestions
