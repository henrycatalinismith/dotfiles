path=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "$HOME/.docker/bin"
  $path
)

typeset -U path
export PATH
