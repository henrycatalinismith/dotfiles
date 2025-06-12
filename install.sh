#!/bin/sh

sudo apt install -y alacritty
sudo apt install -y apache2-utils
sudo apt install -y atuin
sudo apt install -y bat
sudo apt install -y curl
sudo apt install -y flameshot
sudo apt install -y fzf
sudo apt install -y git
sudo apt install -y gnome-shell-extension-manager
sudo apt install -y gnome-tweaks
sudo apt install -y ripgrep
sudo apt install -y unzip
sudo apt install -y zoxide
sudo apt install -y zsh

sudo apt install -y build-essential
sudo apt install -y pkg-config
sudo apt install -y autoconf
sudo apt install -y bison
sudo apt install -y clang
sudo apt install -y rustc
sudo apt install -y sqlite3
sudo apt install -y libsqlite3-0
sudo apt install -y redis-tools
sudo apt install -y ffmpeg


sudo snap install nvim --classic
sudo snap install zellij --classic

sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
sudo apt update -y
sudo apt install -y fastfetch

sudo apt install -y gnome-shell-extension-manager
sudo apt install -y pipx
pipx install gnome-extensions-cli --system-site-packages

gnome-extensions disable tiling-assistant@ubuntu.com
gnome-extensions disable ubuntu-appindicators@ubuntu.com
gnome-extensions disable ubuntu-dock@ubuntu.com
gnome-extensions disable ding@rastersoft.com

gext install just-perfection-desktop@just-perfection
gext install blur-my-shell@aunetx
gext install space-bar@luchrioh
gext install undecorate@sun.wxg@gmail.com
gext install tophat@fflewddur.github.io
gext install AlphabeticalAppGrid@stuarthayhurst

sudo cp ~/.local/share/gnome-shell/extensions/just-perfection-desktop\@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/blur-my-shell\@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/space-bar\@luchrioh/schemas/org.gnome.shell.extensions.space-bar.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/tophat@fflewddur.github.io/schemas/org.gnome.shell.extensions.tophat.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/AlphabeticalAppGrid\@stuarthayhurst/schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

gsettings set org.gnome.shell.extensions.just-perfection animation 2
gsettings set org.gnome.shell.extensions.just-perfection dash-app-running true
gsettings set org.gnome.shell.extensions.just-perfection workspace true
gsettings set org.gnome.shell.extensions.just-perfection workspace-popup false

gsettings set org.gnome.shell.extensions.blur-my-shell.appfolder blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.lockscreen blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.screenshot blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.window-list blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.panel blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.overview blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.overview pipeline 'pipeline_default'
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock brightness 0.6
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock sigma 30
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock static-blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock style-dash-to-dock 0

gsettings set org.gnome.shell.extensions.space-bar.behavior smart-workspace-names false
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-activate-workspace-shortcuts false
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-move-to-workspace-shortcuts true
gsettings set org.gnome.shell.extensions.space-bar.shortcuts open-menu "@as []"

gsettings set org.gnome.shell.extensions.tophat show-icons false
gsettings set org.gnome.shell.extensions.tophat show-cpu false
gsettings set org.gnome.shell.extensions.tophat show-disk false
gsettings set org.gnome.shell.extensions.tophat show-mem false
gsettings set org.gnome.shell.extensions.tophat show-fs false
gsettings set org.gnome.shell.extensions.tophat network-usage-unit bits

gsettings set org.gnome.shell.extensions.alphabetical-app-grid folder-order-position 'end'

gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6

# No tiling popup after tiling a window
gsettings set org.gnome.shell.extensions.tiling-assistant enable-tiling-popup false

# ⌘-Shift-C to center
gsettings set org.gnome.shell.extensions.tiling-assistant center-window ['<Control><Super>c']

# ⌘-Shift-Enter to maximise/restore
gsettings set org.gnome.shell.extensions.tiling-assistant restore-window @as []
gsettings set org.gnome.shell.extensions.tiling-assistant tile-maximize ['<Control><Super>Return']

# ⌘-Shift-Arrows to tile
gsettings set org.gnome.shell.extensions.tiling-assistant tile-bottom-half ['<Control><Super>Down']
gsettings set org.gnome.shell.extensions.tiling-assistant tile-left-half ['<Control><Super>Left']
gsettings set org.gnome.shell.extensions.tiling-assistant tile-right-half ['<Control><Super>Right']
gsettings set org.gnome.shell.extensions.tiling-assistant tile-top-half ['<Control><Super>Up']

# No corner tiling
gsettings set org.gnome.shell.extensions.tiling-assistant tile-bottomleft-quarter @as []
gsettings set org.gnome.shell.extensions.tiling-assistant tile-bottomright-quarter @as []
gsettings set org.gnome.shell.extensions.tiling-assistant tile-topleft-quarter @as []
gsettings set org.gnome.shell.extensions.tiling-assistant tile-topright-quarter @as []

gsettings set org.gnome.desktop.wm.keybindings close "['<Super>Q']"

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>Right']"

