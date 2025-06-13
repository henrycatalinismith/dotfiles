PACKAGES = \
	alacritty \
	apache2-utils \
	autoconf \
	bat \
	bison \
	build-essential \
	clang \
	curl \
	ffmpeg \
	flameshot \
	fzf \
	git \
	gnome-shell-extension-manager \
	gnome-tweaks \
	libsqlite3-0 \
	pipx \
	pkg-config \
	redis-tools \
	ripgrep \
	rustc \
	sqlite3 \
	unzip \
	zoxide \
	zsh \

SNAPS = \
	nvim \
	zellij

.PHONY: packages
packages: $(PACKAGES)

$(PACKAGES):
	@if ! dpkg -s $@ >/dev/null 2>&1; then \
		echo "Installing package $@..."; \
		sudo apt install -y $@; \
	else \
		echo "$@ is already installed."; \
	fi

.PHONY: snaps
snaps: $(SNAPS)

$(SNAPS):
	@if ! snap list $@ >/dev/null 2>&1; then \
		echo "Installing snap $@..."; \
		sudo snap install $@ --classic; \
	else \
		echo "$@ is already installed."; \
	fi

.PHONY: gnome-extensions-cli
gnome-extensions-cli: pipx
	pipx install gnome-extensions-cli --system-site-packages

