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
      sudo -v

      sudo spctl --master-disable
      sudo chflags nohidden /Volumes

      defaults write NSGlobalDomain AppleShowAllExtensions -bool true
      defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
      defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
      defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
      defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
      defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
      defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

      defaults write com.apple.Safari ShowFavoritesBar -bool false
      defaults write com.apple.Safari IncludeDevelopMenu -bool true
      defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

      # https://developer.apple.com/documentation/devicemanagement/dock
      defaults write com.apple.dock mineffect -string "scale"
      defaults write com.apple.dock minimize-to-application -bool true
      defaults write com.apple.dock show-process-indicators -bool false
      defaults write com.apple.dock static-only -bool true
      defaults write com.apple.dock wvous-bl-corner -int 11
      defaults write com.apple.dock wvous-bl-modifier -int 0
      defaults write com.apple.dock wvous-br-corner -int 2
      defaults write com.apple.dock wvous-br-modifier -int 0
      killall Dock

      defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
      defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

      defaults write com.apple.finder _FXSortFoldersFirst -bool true
      defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
      defaults write com.apple.finder NewWindowTarget -string "Pflo"
      defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
      defaults write com.apple.finder ShowRecentTags -bool false
      defaults write com.apple.finder SidebarWidth -int 128
      defaults write com.apple.finder WarnOnEmptyTrash -bool false
      killall Finder

      defaults write com.apple.frameworks.diskimages skip-verify -bool true
      defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
      defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
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
      brew bundle --file=~/.Brewfile
    ;;

    "uninstall")
      for file in `dotfiles ls-files`; do
        echo $file
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

