export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

if [ -s "/opt/homebrew/bin/brew" ]
then
  eval $(/opt/homebrew/bin/brew shellenv)
elif [ -s "/usr/local/bin/brew" ]
then
  eval $(/usr/local/bin/brew shellenv)
fi
