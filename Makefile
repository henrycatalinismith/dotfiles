DOTFILES=~/.dotfiles

default:
	@echo "  install       Install all config files"
	@echo "  uninstall     Remove all config files"


install: \
	~/.gitconfig

uninstall:
	rm -f $(HOME)/.gitconfig


~/.gitconfig:
	ln -s $(DOTFILES)/git/gitconfig $(HOME)/.gitconfig

.PHONY: \
	default \
	install \
	uninstall

