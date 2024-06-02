DOTFILE=$(pwd)

echo "link .zshrc ..."
mv $HOME/.zshrc $HOME/.zshrc.bak.$(date +"%Y%m%d%H%M%S")
ln -s $DOTFILE/zsh/.zshrc $HOME

echo "link ssh config ..."
ln -s $DOTFILE/ssh/config $HOME/.ssh

echo "link .condarc ..."
ln -s $DOTFILE/conda/.condarc $HOME

echo "link pip config ..."
ln -s $DOTFILE/pip $HOME/.config

echo "link starship.toml ..."
ln -s $DOTFILE/starship/starship.toml $HOME/.config

echo "link alacritty.toml ..."
mkdir -p $HOME/.config/alacritty
if [ ! -d "$HOME/.config/alacritty/themes" ] then
	git clone https://github.com/alacritty/alacritty-theme $HOME/.config/alacritty/themes
fi
ln -s $DOTFILE/alacritty/alacritty.toml $HOME/.config/alacritty
