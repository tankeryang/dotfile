# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Use antigen to manage config plugins
source /usr/local/share/antigen/antigen.zsh
export ANTIGEN="$HOME/.antigen"

# Use ohmyzsh
antigen use oh-my-zsh
# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

# Load plugins
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(
#   git osx sudo autojump zsh-syntax-highlighting zsh-autosuggestions
# )
# [[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh
antigen bundle git
antigen bundle osx
antigen bundle sudo
antigen bundle autojump
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle Aloxaf/fzf-tab
# 1. brew install lsd
# 2. git clone https://github.com/wintermi/zsh-lsd.git $ANTIGEN/bundle/wintermi/zsh-lsd
antigen bundle wintermi/zsh-lsd

# Load the theme.
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
antigen theme ys
# antigen theme jispwoso
# antigen theme frisk
# antigen theme spaceship-prompt/spaceship-prompt
# eval "$(starship init zsh)"  # brew install starship

# Apply antigen configuration
antigen apply
# source $ZSH/oh-my-zsh.sh

# User configuration
#########################################################################################
# 
# My config
#
#########################################################################################

# alias
alias virtualenv=virtualenv
alias cl=clear
alias gcz='git cz'
alias gui=gitui
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"
alias nvid=neovide

# ~/.local/bin
export PATH=$HOME/.local/bin:$PATH

# /usr/local/bin
export PATH=/usr/local/bin:$PATH

# mysql PATH
export PATH=$PATH:/usr/local/opt/mysql-client/bin
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

# java home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export CLASS_PATH=$JAVA_HOME/lib
export PATH=$PATH:$JAVA_HOME/bin

# scala
export SCALA_HOME=$HOME/Applications/scala-2.13.10
export PATH=$PATH:$SCALA_HOME/bin

# maven
export M2_HOME=$HOME/Applications/apache-maven-3.8.4
export M2=$M2_HOME/bin
export PATH=$PATH:$M2

# golang
export GOPATH=$HOME/Applications/go-1.22.2
export GOBIN=$GOPATH/bin
export GOPROXY=https://goproxy.cn
export PATH=$PATH:$GOBIN

# nvm
export NVM_DIR="$HOME/.nvm"
export NVM_NODEJS_ORG_MIRROR="https://npm.taobao.org/mirrors/node"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bindkey -v

# stty -ixon
