path=(
  /opt/homebrew/bin
  "$HOME/.local/bin"
  "$HOME/.docker/bin"
  $path
)

typeset -U path
export PATH
