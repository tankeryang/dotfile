# Var
OSTYPE=$(uname -s)
MACOS="Darwin"
LINUX="Linux"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# ~/.local/bin
export PATH=$HOME/.local/bin:$PATH
# /usr/local/bin
export PATH=/usr/local/bin:$PATH
# HomeBrew
# NOTICE: Apple Sillicon Mac homebrew install in `/opt/homebrew`
if [ "$OSTYPE" = "$MACOS" ]; then
    export PATH=/opt/homebrew/bin:$PATH
    export HOMEBREW=$(brew --prefix)
    export HOMEBREW_NO_AUTO_UPDATE=1  # disable brew auto update
fi


# Zinit ===========================================================================================================
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "$ZINIT_HOME/zinit.zsh"


# Theme ===========================================================================================================
eval "$(starship init zsh)"  # brew install starship


# Plugins =========================================================================================================
zinit load zdharma-continuum/history-search-multi-word
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting

zinit wait lucid for light-mode \
  Aloxaf/fzf-tab \
  wfxr/forgit \
  has'lsd' \
    tankeryang/zsh-lsd \
  has'eza' \
    tankeryang/zsh-eza \
  OMZL::clipboard.zsh \
  OMZL::history.zsh \
  OMZL::directories.zsh \
  OMZL::grep.zsh \
  OMZP::autojump

autoload -U compinit && compinit
zinit cdreplay -q


# User configuration ==============================================================================================

# alias
alias cl=clear
alias h="history -i"
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"
alias gcz=czg # npm -g install czg
if type gitui &>/dev/null; then
  alias gui=gitui
fi # brew install gitui / cargo install gitui --locked
if type neovide &>/dev/null; then
  alias nvid=neovide
fi # brew install neovide
if type duf &>/dev/null; then
  alias df=duf
fi # brew install duf / apt install duf
if type dust &>/dev/null; then
  alias du=dust
fi # brew install dust / cargo install du-dust

# java
if [ "$OSTYPE" = "$MACOS" ]; then
  export JAVA_8_HOME=$HOME/Applications/jdk/zulu8.84.0.15-ca-jdk8.0.442-macosx_aarch64
  export JAVA_11_HOME=$HOME/Applications/jdk/jdk-11.0.26+4/Contents/Home
  export JAVA_17_HOME=$HOME/Applications/jdk/jdk-17.0.14+7/Contents/Home
  export JAVA_21_HOME=$HOME/Applications/jdk/jdk-21.0.6+7/Contents/Home
elif [ "$OSTYPE" = "$LINUX" ]; then
  export JAVA_8_HOME=$HOME/Applications/jdk/jdk8u422-b05
  export JAVA_11_HOME=$HOME/Applications/jdk/jdk-11.0.26+4
  export JAVA_17_HOME=$HOME/Applications/jdk/jdk-17.0.12+7
fi
export JAVA_HOME=$JAVA_17_HOME
export CLASS_PATH=$JAVA_HOME/lib
export PATH=$JAVA_HOME/bin:$PATH

# golang
export GO_1_22_3_PATH=$HOME/Applications/go/go-1.22.3
export GOPATH=$GO_1_22_3_PATH
export GOBIN=$GOPATH/bin
export GOPROXY=https://goproxy.cn
export PATH=$GOBIN:$PATH

# rust
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
export CARGO_UNSTABLE_SPARSE_REGISTRY=true
export RUSTUP_HOME=$HOME/Applications/rust/.rustup
export CARGO_HOME=$HOME/Applications/rust/.cargo
export PATH=$CARGO_HOME/bin:$RUSTUP_HOME/bin:$PATH

# perl5
if [ "$OSTYPE" = "$MACOS" ]; then
  PERL_PATH="$HOME/perl5"
  if [ -d "$PERL_PATH" ]; then
    export PATH=$PERL_PATH/bin:$PATH
    export PERL5LIB=$PERL_PATH/lib/perl5
    export PERL_LOCAL_LIB_ROOT=$PERL_PATH
    export PERL_MB_OPT="--install_base \"$PERL_PATH\""
    export PERL_MM_OPT="INSTALL_BASE=$PERL_PATH"
  fi
fi

# nvim
if [ "$OSTYPE" = "$LINUX" ]; then
  NVIM_PATH="${HOME}/Applications/nvim-linux64"
  if [ -d "$NVIM_PATH" ]; then
    export PATH=$NVIM_PATH/bin:$PATH
  fi
fi

# fnm
if [ "$OSTYPE" = "$LINUX" ]; then
  FNM_PATH="$HOME/.local/share/fnm"
  if [ -d "$FNM_PATH" ]; then
    export PATH="$FNM_PATH:$PATH"
  fi
fi
if type fnm > /dev/null 2>&1; then
  eval "$(fnm env --use-on-cd)"
fi

# maven
if [ "$OSTYPE" = "$MACOS" ]; then
  M2_VERSION="3.9.6"
elif [ "$OSTYPE" = "$LINUX" ]; then
  M2_VERSION="3.9.9"
fi
export M2_HOME=$HOME/Applications/apache-maven-$M2_VERSION
export M2=$M2_HOME/bin
export PATH=$M2:$PATH

# mysql
# mysql-client is keg-only, which means it was not symlinked into /opt/homebrew,
# because it conflicts with mysql (which contains client libraries).
# If you need to have mysql-client first in your PATH, run:
if [ "$OSTYPE" = "$MACOS" ]; then
  MYSQL_CLIENT_PATH="$HOMEBREW/opt/mysql-client"
  if [ -d "$MYSQL_CLIENT_PATH" ]; then
    export PATH=$MYSQL_CLIENT_PATH/bin:$PATH
    # For compilers to find mysql-client you may need to set:
    export LDFLAGS="-L$MYSQL_CLIENT_PATH/lib"
    export CPPFLAGS="-I$MYSQL_CLIENT_PATH/include"
  fi
fi

# android tools
if [ "$OSTYPE" = "$MACOS" ]; then
  export ANDROID_PLATFORM_TOOLS="$HOME/Library/Android/sdk/platform-tools"
  export PATH=$ANDROID_PLATFORM_TOOLS:$PATH
fi

# cmake
if [ "$OSTYPE" = "$LINUX" ]; then
  CMAKE_HOME=$HOME/Applications/cmake-3.31.5-linux-x86_64
  export PATH=$CMAKE_HOME/bin:$PATH
fi

# esc to use vim mode and bind other key
bindkey -v
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

stty -ixon

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/Applications/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/Applications/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/Applications/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/Applications/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

