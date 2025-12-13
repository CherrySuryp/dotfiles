.PHONY: install install-omz install-omz-plugins

install:
ifdef CLEAN
	rm -rf ~/.oh-my-zsh
endif
	$(MAKE) install-omz
	$(MAKE) install-omz-plugins
	@printf "\033[32mDone! Run 'source ~/.zshrc' or open a new terminal.\033[0m\n"

install-omz:
	# -- Install Oh My Zsh --
	RUNZSH=no KEEP_ZSHRC=yes sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

install-omz-plugins:
ifdef CLEAN
	rm -rf ~/.oh-my-zsh/custom
endif
	# --- Install Omz plugins ---
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions.git $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use

	# -- Install p10k theme --
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
