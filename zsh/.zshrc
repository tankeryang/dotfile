# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# ~/.local/bin
export PATH=$HOME/.local/bin:$PATH
# /usr/local/bin
export PATH=/usr/local/bin:$PATH

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
alias venv=virtualenv
alias cl=clear
alias gcz='czg'  # npm -g install cgz
alias gui=gitui  # brew install gitui
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"
alias nvid=neovide  # brew install neovide
alias df=duf  # brew install duf
alias du=dust  # brew install dust
alias h="history -i"

# java home
export JAVA_8_HOME=$HOME/Applications/jdk8u422-b05
export JAVA_11_HOME=$HOME/Applications/jdk-11.0.26+4
export JAVA_17_HOME=$HOME/Applications/jdk-17.0.12+7
export JAVA_HOME=$JAVA_11_HOME
export CLASS_PATH=$JAVA_HOME/lib
export PATH=$JAVA_HOME/bin:$PATH

# golang
export GO_1_22_3_PATH=$HOME/Applications/go-1.22.3
export GOPATH=$GO_1_22_3_PATH
export GOBIN=$GOPATH/bin
export GOPROXY=https://goproxy.cn
export PATH=$GOBIN:$PATH

# maven
export M2_HOME=$HOME/Applications/apache-maven-3.9.9
export M2=$M2_HOME/bin
export PATH=$M2:$PATH

# fnm
FNM_PATH="/home/yang/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env --use-on-cd`"
fi

# rust
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
export CARGO_UNSTABLE_SPARSE_REGISTRY=true
export RUSTUP_HOME=$HOME/Applications/rust/.rustup
export CARGO_HOME=$HOME/Applications/rust/.cargo
export PATH=$CARGO_HOME/bin:$RUSTUP_HOME/bin:$PATH

# esc to use vim mode
bindkey -v

stty -ixon


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/yang/Applications/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/yang/Applications/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/yang/Applications/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/yang/Applications/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
