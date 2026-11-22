export CLICOLOR=1

if [[ "$OSTYPE" == linux* ]]; then
  eval "$(dircolors -b)"
  alias ls='ls --color=auto'
fi
