SYSTEMD_CONFIG_DIR    = $(HOME)/.config/systemd
MK_SYSTEMD_DIR         = $(shell mkdir -p $(SYSTEMD_CONFIG_DIR))

.PHONY: install
install:
	mkdir -p $(SYSTEMD_CONFIG_DIR)
	cd $(SYSTEMD_CONFIG_DIR) && { [ -e user ] || ln -s $(CURDIR)/user; }
	systemctl --user enable main.target
	systemctl --user enable tmux
	systemctl --user enable monopasted
	systemctl --user enable emacs

.PHONY: clean
clean:
	rm -f $(SYSTEMD_CONFIG_DIR)/user
	cd user && rm -rf *.target.wants/
