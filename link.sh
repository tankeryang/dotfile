HOME_PATH=$(echo $HOME)
DOTFILE_PATH=$(pwd)

echo "link curl dotfile..."
ln -s ${DOTFILE_PATH}/curl/.curlrc ${HOME_PATH}

echo "link conda dotfile..."
ln -s ${DOTFILE_PATH}/conda/.condarc ${HOME_PATH}

echo "link ssh config file..."
ln -s ${DOTFILE_PATH}/ssh/config ${HOME_PATH}/.ssh

echo "link tmux dotfile..."
ln -s ${DOTFILE_PATH}/tmux/.tmux.conf ${HOME_PATH}

echo "link vim dotfile..."
ln -s ${DOTFILE_PATH}/vim/.vimrc ${HOME_PATH}
ln -s ${DOTFILE_PATH}/vim/.vimrc.bundles ${HOME_PATH}

echo "link zsh dotfile..."
ln -s ${DOTFILE_PATH}/zsh/.zshrc ${HOME_PATH}
