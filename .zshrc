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

    "macos")
      defaults write com.apple.dock mouse-over-hilite-stack -bool true
      defaults write com.apple.dock tilesize -int 64
      defaults write com.apple.dock mineffect -string "scale"
      defaults write com.apple.dock show-process-indicators -bool true
      defaults write com.apple.dock launchanim -bool false
      defaults write com.apple.dock autohide-time-modifier -float 0
      defaults write com.apple.dock autohide-delay -float 0
      defaults write com.apple.dock autohide -bool true
      defaults write com.apple.dock showhidden -bool true
      defaults write com.apple.dock show-recents -bool false
      killall Dock
      defaults write NSGlobalDomain AppleShowAllExtensions -bool true
      defaults write com.apple.finder NewWindowTarget -string "Pflo"
      defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
      defaults write com.apple.finder ShowStatusBar -bool true
      defaults write com.apple.finder ShowPathbar -bool true
      defaults write com.apple.finder ShowRecentTags -bool false
      defaults write com.apple.finder SidebarWidth -int 164
      defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
      defaults write com.apple.finder _FXSortFoldersFirst -bool true
      defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
      defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
      defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
      defaults write com.apple.frameworks.diskimages skip-verify -bool true
      defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
      defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
      defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
      defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
      defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
      defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
      killall Finder
      defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
      defaults write com.apple.Safari HomePage -string "about:blank"
      defaults write com.apple.Safari ShowFavoritesBar -bool false
      defaults write com.apple.Safari IncludeDevelopMenu -bool true
      defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
      defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
      defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
      defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
      defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
      killall Safari
      defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
      defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
      defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
      defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
      defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1
      defaults write com.apple.commerce AutoUpdateRestartRequired -bool true
      defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
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

