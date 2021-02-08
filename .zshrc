function dotfiles() {
  if [[ $# -eq 0 ]]
  then
    echo "$fg_no_bold[cyan]homebrew$reset_color   install homebrew"
    echo "$fg_no_bold[cyan]install$reset_color    install dotfiles"
    echo "$fg_no_bold[cyan]plugin$reset_color     add a new vim plugin"
    echo "$fg_no_bold[cyan]plugins$reset_color    install all vim plugins"
    echo "$fg_no_bold[cyan]reinstall$reset_color  clean out + start again"
    echo "$fg_no_bold[cyan]toolbox$reset_color    install usual homebrew tools"
    echo "$fg_no_bold[cyan]uninstall$reset_color  undo installation"
    echo "$fg_no_bold[cyan]update$reset_color     pull changes from github"
    echo "$fg_no_bold[cyan]upload$reset_color     push changes to github"
    return
  fi

  case $1 in

    "homebrew")
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    ;;

    "install")
      /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/hencatsmith/dotfiles/trunk/install.sh)"
    ;;

    "plugin")
      dotfiles submodule add -f $3 .vim/pack/plugins/start/$2
      dotfiles c $2
      dotfiles plugins
    ;;

    "plugins")
      rm -rf ~/.vim
      dotfiles checkout trunk -- ~/.vim
      dotfiles submodule update --init --recursive
    ;;

    "reinstall")
      dotfiles uninstall
      dotfiles install
    ;;

    "toolbox")
      brew install \
        coreutils \
        cowsay \
        ffmpeg \
        fzf \
        git \
        htop \
        jq \
        nethack \
        nmap \
        node \
        python \
        rbenv \
        ruby-build \
        sl \
        telnet \
        tldr \
        tree \
        tmux \
        watch \
        wget \
        yarn

      case `uname` in
        Darwin)
          brew install iterm2 macvim
          brew tap homebrew/cask-fonts \
            && brew cask install font-iosevka \
            && brew cask install font-iosevka-slab
        ;;
      esac
    ;;

    "uninstall")
      for file in `dotfiles ls-files`; do
        rm -rf ~/$file;
      done
      rm -rf ~/.dotfiles
    ;;

    "update")
      dotfiles fetch --all
      dotfiles checkout
      for file in `dotfiles ls-files`; do
        if [[ -f ~/$file ]]
        then
          dotfiles reset ~/$file
          dotfiles checkout -- ~/$file
        fi
      done
    ;;

    "upload")
      dotfiles push origin trunk
    ;;

    *)
      git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
    ;;
  esac
}

alias pico8="/Applications/PICO-8.app/Contents/MacOS/pico8"
alias t="tree -L 1 -C --dirsfirst"

plugins=(git rbenv)

export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="sunrise"

if [[ -d ~/$file ]]
then
  source $HOME/.oh-my-zsh/oh-my-zsh.sh
fi

export ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_no_bold[cyan]%}‹"
export ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_no_bold[cyan]%}›%{$RESET%} "

