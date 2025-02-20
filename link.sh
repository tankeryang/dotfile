if [ ! -d "$HOME/.config" ]; then
	mkdir $HOME/.config
fi

echo "stow zsh"
if [ -f "$HOME/.zshrc" ]; then
  mv $HOME/.zshrc $HOME/.zshrc.bak.$(date +"%Y%m%d%H%M%S")
fi
stow zsh -t $HOME

echo "stow ssh"
stow ssh -t $HOME

echo "stow conda"
stow conda -t $HOME

echo "stow pip"
stow pip -t $HOME

echo "stow ghostty"
stow ghostty -t $HOME

echo "stow starship"
stow starship -t $HOME

echo "stow alacritty"
mkdir -p $HOME/.config/alacritty
if [ ! -d "$HOME/.config/alacritty/themes" ] then
	git clone https://github.com/alacritty/alacritty-theme $HOME/.config/alacritty/themes
fi
stow alacritty -t $HOME
