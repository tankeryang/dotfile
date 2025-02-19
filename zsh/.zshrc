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
# homebrew
# Apple Sillicon Mac homebrew install in /opt/homebrew
if [ "$OSTYPE" = "$MACOS" ]; then
    export PATH=/opt/homebrew/bin:$PATH
    export HOMEBREW=$(brew --prefix)
    export HOMEBREW_NO_AUTO_UPDATE=1  # disable brew auto update
fi

# Z-Shell/ZI ======================================================================================================
# > https://wiki.zshell.dev/
# source <(curl -sL init.zshell.dev); zzinit
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod go-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://wiki.zshell.dev/ecosystem/category/-annexes
zicompinit # <- https://wiki.zshell.dev/docs/guides/commands
zi light-mode for \
  z-shell/z-a-meta-plugins \
  @annexes @zunit

# Theme ===========================================================================================================

zi ice as"command" from"gh-r" \
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  atpull"%atclone" src"init.zsh"
zi light starship/starship

# Plugins =========================================================================================================

zi wait lucid light-mode for \
  atinit"ZI[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
     z-shell/F-Sy-H \
  blockf \
     zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
     zsh-users/zsh-autosuggestions \
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

# User configuration ==============================================================================================

# alias
alias cl=clear
alias h="history -i"
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"
if type czg &>/dev/null; then
  alias gcz='czg'
fi # npm -g install cgz
if type gitui &>/dev/null; then
  alias gui=gitui
fi # brew install gitui
if type neovide &>/dev/null; then
  alias nvid=neovide
fi # brew install neovide
if type duf &>/dev/null; then
  alias df=duf
fi # brew install duf
if type dust &>/dev/null; then
  alias du=dust
fi # brew install dust

# java
if [ "$OSTYPE" = "$MACOS" ]; then
  export JAVA_8_HOME=$HOME/Applications/zulu8.78.0.19-ca-jdk8.0.412-macosx_aarch64
  export JAVA_17_HOME=$HOME/Applications/graalvm-jdk-17.0.11+7.1/Contents/Home
elif [ "$OSTYPE" = "$LINUX" ]; then
  export JAVA_8_HOME=$HOME/Applications/jdk8u422-b05
  export JAVA_11_HOME=$HOME/Applications/jdk-11.0.26+4
  export JAVA_17_HOME=$HOME/Applications/jdk-17.0.12+7
fi
export JAVA_HOME=$JAVA_17_HOME
export CLASS_PATH=$JAVA_HOME/lib
export PATH=$JAVA_HOME/bin:$PATH

# golang
export GO_1_22_3_PATH=$HOME/Applications/go-1.22.3
export GOPATH=$GO_1_22_3_PATH
export GOBIN=$GOPATH/bin
export GOPROXY=https://goproxy.cn
export PATH=$GOBIN:$PATH

# maven
export M2_HOME=$HOME/Applications/apache-maven-3.9.6
export M2=$M2_HOME/bin
export PATH=$M2:$PATH

# fnm
if type fnm > /dev/null 2>&1; then
  eval "$(fnm env --use-on-cd)"
fi
# eval "$(fnm env --use-on-cd)" > /dev/null 2>&1

# mysql
# mysql-client is keg-only, which means it was not symlinked into /opt/homebrew,
# because it conflicts with mysql (which contains client libraries).
# If you need to have mysql-client first in your PATH, run:
if [ "$OSTYPE" = "$MACOS" ]; then
  MYSQL_CLIENT_PATH="${HOMEBREW}/opt/mysql-client"
  if [ -d "$MYSQL_CLIENT_PATH" ]; then
    export PATH=${MYSQL_CLIENT_PATH}/bin:$PATH
    # For compilers to find mysql-client you may need to set:
    export LDFLAGS="-L${MYSQL_CLIENT_PATH}/lib"
    export CPPFLAGS="-I${MYSQL_CLIENT_PATH}/include"
  fi
fi

# perl5
if [ "$OSTYPE" = "$MACOS" ]; then
  PERL_PATH="${HOME}/perl5"
  if [ -d "$PERL_PATH" ]; then
    export PATH=${PERL_PATH}/bin:$PATH
    export PERL5LIB=${PERL_PATH}/lib/perl5
    export PERL_LOCAL_LIB_ROOT=${PERL_PATH}
    export PERL_MB_OPT="--install_base \"${PERL_PATH}\""
    export PERL_MM_OPT="INSTALL_BASE=${PERL_PATH}"
  fi
fi

# rust
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
export CARGO_UNSTABLE_SPARSE_REGISTRY=true
export RUSTUP_HOME=$HOME/Applications/rust/.rustup
export CARGO_HOME=$HOME/Applications/rust/.cargo
export PATH=$CARGO_HOME/bin:$RUSTUP_HOME/bin:$PATH

# android tools
if [ "$OSTYPE" = "$MACOS" ]; then
  export ANDROID_PLATFORM_TOOLS="$HOME/Library/Android/sdk/platform-tools"
  export PATH=$ANDROID_PLATFORM_TOOLS:$PATH
fi

# nvim
if [ "$OSTYPE" = "$LINUX" ]; then
  NVIM_PATH="${HOME}/Applications/nvim-linux64"
  if [ -d "$NVIM_PATH" ]; then
    export PATH=${NVIM_PATH}/bin:$PATH
  fi
fi

# esc to use vim mode
bindkey -v

stty -ixon

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('${HOME}/Applications/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${HOME}/Applications/miniconda3/etc/profile.d/conda.sh" ]; then
        . "${HOME}/Applications/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="${HOME}/Applications/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

