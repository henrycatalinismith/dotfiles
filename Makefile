
ETC=$(shell pwd)

default:
	@echo "  install       Install all config files"
	@echo "  uninstall     Remove all config files"

install: ~/.gitconfig

uninstall:
	rm -f $(HOME)/.gitconfig

~/.gitconfig:
	rm -f $(HOME)/.gitconfig
	ln -s $(ETC)/git/gitconfig $(HOME)/.gitconfig

.PHONY: \
	default \
	install \
	uninstall

