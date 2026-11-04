if [[ -o interactive ]] && (( $+commands[phoon] && $+commands[lolcat] )); then
  clear
  phoon | lolcat
fi
