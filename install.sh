HOME_PATH=$(echo $HOME)
DOTFILE_PATH=$(pwd)

echo "link ssh config"
mkdir -p $HOME_PATH/.ssh && rm -rf $HOME_PATH/.ssh/config
ln -s ${DOTFILE_PATH}/ssh/config ${HOME_PATH}/.ssh/config

echo "link vim config"
rm -rf $HOME_PATH/.vim && mkdir -p $HOME_PATH/.vim
rm -rf $HOME_PATH/.config/nvim && mkdir -p $HOME_PATH/.config/nvim/lua
ln -s ${DOTFILE_PATH}/vim/.vimrc ${HOME_PATH}/.vim/.vimrc
ln -s ${DOTFILE_PATH}/vim/.vimrc.plug ${HOME_PATH}/.vim/.vimrc.plug
ln -s ${DOTFILE_PATH}/vim/init.vim ${HOME_PATH}/.config/nvim/init.vim

echo "install oh-my-zsh and link config"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -rf $HOME_PATH/.zshrc
ln -s ${DOTFILE_PATH}/zsh/.zshrc ${HOME_PATH}/.zshrc


