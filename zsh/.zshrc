# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# ~/.local/bin
export PATH=$HOME/.local/bin:$PATH
# /usr/local/bin
export PATH=/usr/local/bin:$PATH
# homebrew
# Apple Sillicon Mac homebrew install in /opt/homebrew
export PATH=/opt/homebrew/bin:$PATH
export HOMEBREW=$(brew --prefix)

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
  OMZL::clipboard.zsh \
  OMZL::history.zsh \
  OMZL::directories.zsh \
  OMZL::grep.zsh \
  OMZP::autojump

# User configuration ==============================================================================================

# alias
alias virtualenv=virtualenv
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

# java home
export JAVA_8_HOME=$HOME/Applications/zulu8.78.0.19-ca-jdk8.0.412-macosx_aarch64
export CLASS_PATH=$JAVA_8_HOME/lib
export PATH=$JAVA_8_HOME/bin:$PATH

# golang
export GOPATH=$HOME/Applications/go-1.22.3
export GOBIN=$GOPATH/bin
export GOPROXY=https://goproxy.cn
export PATH=$PATH:$GOBIN

# maven
export M2_HOME=$HOME/Applications/apache-maven-3.9.6
export M2=$M2_HOME/bin
export PATH=$PATH:$M2

# fnm
eval "$(fnm env --use-on-cd)" > /dev/null 2>&1

# mysql
# mysql-client is keg-only, which means it was not symlinked into /opt/homebrew,
# because it conflicts with mysql (which contains client libraries).
# If you need to have mysql-client first in your PATH, run:
export PATH=${HOMEBREW}/opt/mysql-client/bin:$PATH
# For compilers to find mysql-client you may need to set:
export LDFLAGS="-L$HOMEBREW/opt/mysql-client/lib"
export CPPFLAGS="-I$HOMEBREW/opt/mysql-client/include"

# esc to use vim mode
bindkey -v

stty -ixon
