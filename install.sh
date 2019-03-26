HOME_PATH=$(echo $HOME)
DOTFILE_PATH=$(pwd)

echo "link curl dotfile..."
ln -s ${DOTFILE_PATH}/curl/.curlrc ${HOME_PATH}

echo "install oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "install homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

