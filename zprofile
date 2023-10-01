export ANDROID_HOME=/Users/hen/Library/Android/sdk
export CLICOLOR=1
export NVM_DIR="$HOME/.nvm"
export PATH="/Users/hen/.local/share/gem/ruby/3.2.0/bin/:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

if [ -s "/opt/homebrew/bin/brew" ]
then
  eval $(/opt/homebrew/bin/brew shellenv)
elif [ -s "/usr/local/bin/brew" ]
then
  eval $(/usr/local/bin/brew shellenv)
fi

echo lol