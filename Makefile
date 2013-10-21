PWD:=$(shell pwd)
DOTFILES:=$(shell find $(PWD) -maxdepth 1 -name '.*' -type f)
INSTALLED_DOTFILES=$(patsubst $(PWD)/%,$(HOME)/%,$(DOTFILES))

help:
	@echo Usage: gmake install
	@echo Be sure to use GNU Make
	@echo
	@echo install symlinks in $(HOME) directory to $(PWD)

install: $(INSTALLED_DOTFILES)


forceclean:
	@for file in $(INSTALLED_DOTFILES) ; do \
		rm -fv $$file ; \
	done

forceinstall: forceclean install

$(HOME)/.%:
	ln -s $(PWD)/$(shell basename $@) $@
