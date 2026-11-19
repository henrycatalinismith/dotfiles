[[ -d "$HOME/helix" ]] || return

path=(
  "$HOME/helix/target/release"
  $path
)

typeset -U path
export PATH

export HELIX_RUNTIME="$HOME/helix/runtime"
