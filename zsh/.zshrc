eval "$(/opt/homebrew/bin/brew shellenv)"
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

source /opt/homebrew/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen theme romkatv/powerlevel10k
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

XDG_CONFIG_HOME=$HOME/.config

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
    "brew")
      brew bundle --file ~/.config/homebrew/$2.brew
    ;;

    "install")
      git clone -o github git@github.com:hendotcat/dotfiles.git .config
      cd .config
      make install
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

    "reinstall")
      dotfiles uninstall
      dotfiles install
    ;;

    "toolbox")
      brew bundle --file=~/.config/homebrew/Brewfile
    ;;

    "uninstall")
      cd ~/.config && make clean
      rm -rf ~/.config
    ;;

    "update")
      dotfiles pull --rebase github trunk
    ;;

    "upload")
      dotfiles push github trunk
    ;;

    *)
      git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
    ;;
  esac
}

alias pico8="/Applications/PICO-8.app/Contents/MacOS/pico8"
alias t="tree -L 1 -C --dirsfirst"
alias vim="sl"

plugins=(gem git rbenv)

eval "$(/opt/homebrew/bin/rbenv init -)"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  dir
  vcs
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  status
  command_execution_time
  time
)

GIT_BG=4
GIT_FG=15
POWERLEVEL9K_DIR_BACKGROUND=5
POWERLEVEL9K_DIR_FOREGROUND=7
POWERLEVEL9K_VCS_CLEAN_BACKGROUND=$GIT_BG
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=$GIT_BG
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=$GIT_BG
POWERLEVEL9K_VCS_CLEAN_FOREGROUND=$GIT_FG
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=$GIT_FG
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=$GIT_FG
ZLE_RPROMPT_INDENT=0

PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"
