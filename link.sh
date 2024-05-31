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
