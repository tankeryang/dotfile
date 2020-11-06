# my ubuntu dot file

> 公司电脑 dotfile 配置

## vim

> 前提条件: 需安装 `vim 8.1+` 版本，具体方法自行 google (添加第三方ppa源或者编译安装均可)

__请按以下步骤进行__

- 安装插件管理工具 [vim-plug](https://github.com/junegunn/vim-plug) (应该需要挂代理，可在终端全局设置 http.proxy): 
    ```bash
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

- 安装 [Nerd Font](https://www.nerdfonts.com/) 字体，下载喜欢的字体包后，将 `.ttf` 文件解压至 `~/.local/share/font/` 下，然后设置为 __终端字体__

- 安装 `ctags`: `sudo apt install ctags`

- 将 `vim` 下的 `dotfile` 配置 __软链接__ 至 `~/.vim/` 下:
    ```bash
    ln -s /home/yang/workspace/Git/dotfile/vim/.vimrc /home/yang/.vim/ \
    && ln -s /home/yang/workspace/Git/dotfile/vim/.vimrc.plug /home/yang/.vim/ \
    && mv /home/yang/.vim/.vimrc /home/yang/.vim/vimrc
    ```

- 安装 vim 插件: `vim +PlugInstall`

_注意: 在打开 `.py` 文件时，如果 `coc-jedi` 插件报错，比如 `could nor install jedi-language-server`，直接手动去 `coc-jedi` 插件的 `.venv` 目录执行 `pip` 安装_
