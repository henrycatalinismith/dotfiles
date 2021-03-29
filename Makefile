BREW_DST := /usr/local/bin/brew
BREW_SRC := https://raw.githubusercontent.com/Homebrew/install/master/install.sh
PACKER_DIR := ~/.local/share/nvim/site/pack/packer/start
PACKER_DST := $(PACKER_DIR)/packer.nvim
PACKER_SRC := https://github.com/wbthomason/packer.nvim
TMUXRC_SRC := $(HOME)/.config/tmux.conf
TMUXRC_DST := $(HOME)/.tmux.conf
TPM_DIR := tmux/plugins
TPM_DST := $(TPM_DIR)/tpm
TPM_SRC := https://github.com/tmux-plugins/tpm

$(BREW_DST):
	@curl -fsSL $(BREW_SRC)

$(PACKER_DIR):
	@mkdir -p $(PACKER_DIR)

$(PACKER_DST): $(PACKER_DIR)
	@git clone $(PACKER_SRC) $(PACKER_DST)

$(TMUXRC_DST):
	@ln -s $(TMUXRC_SRC) $(TMUXRC_DST)

$(TPM_DIR):
	@mkdir -p $(TPM_DIR)

$(TPM_DST): $(TPM_DIR)
	@git clone $(TPM_SRC) $(TPM_DST)

clean:
	rm -rf $(PACKER_DIR)
	rm $(TMUXRC_DST)
	rm -rf $(TPM_DIR)

install: \
	$(BREW_DST) \
	$(PACKER_DST) \
	$(TMUXRC_DST) \
	$(TPM_DST)

.PHONY: clean install

