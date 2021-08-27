if [ -s "/opt/homebrew/bin/brew" ]
then
  eval $(/opt/homebrew/bin/brew shellenv)
elif [ -s "/usr/local/bin/brew" ]
then
  eval $(/usr/local/bin/brew shellenv)
fi

if [ -s "$HOMEBREW_PREFIX/share/antigen/antigen.zsh" ]
then
  source $HOMEBREW_PREFIX/share/antigen/antigen.zsh
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen theme romkatv/powerlevel10k
  antigen use oh-my-zsh
  antigen apply

  POWERLEVEL9K_DIR_BACKGROUND="#d33682"
  POWERLEVEL9K_DIR_FOREGROUND="#eee8d5"
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    dir
    vcs
  )
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
  POWERLEVEL9K_VCS_CLEAN_BACKGROUND="#28515d"
  POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="#28515d"
  POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="#28515d"
  POWERLEVEL9K_VCS_CLEAN_FOREGROUND="#eee8d5"
  POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="#eee8d5"
  POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="#eee8d5"
  ZLE_RPROMPT_INDENT=0
fi

if [ -s "$(brew --prefix)/opt/asdf/asdf.sh" ]
then
  source "$(brew --prefix)/opt/asdf/asdf.sh"
fi

if [ -s "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ]
then
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
fi

if [ -s "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]
then
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi

if [ -s ~/soundtrap/.zshrc ]
then
  source ~/soundtrap/.zshrc
fi

function dotfiles() {
  if [[ $# -eq 0 ]]
  then
    echo "$fg[cyan]macos$reset_color    configure macOS settings"
  fi

  case $1 in
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

    *)
      git --git-dir=$HOME/.config/.git --work-tree=$HOME/.config/ $@
    ;;
  esac
}

function meg() {
	meta exec "git $1"
}

alias ibrew="arch -x86_64 /usr/local/bin/brew"
alias mbrew="arch -arm64e /opt/homebrew/bin/brew"

