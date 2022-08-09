########################## General shell config ##########################
export EDITOR="vim"

# Enable deleteing things left of the cursor
bindkey "^X\\x7f" backward-kill-line

############################### zsh config ###############################
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

ZSH_THEME="robbyrussell"

setopt NO_CASE_GLOB
setopt EXTENDED_GLOB

# tabtab source for packages
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# initialize autocompletion
autoload -U compinit && compinit

# history setup
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=10000
HISTSIZE=9999
setopt HIST_EXPIRE_DUPS_FIRST
plugins=(git npm history-substring-search)

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward


################################ Aliases #################################

function gw { /workspaces/github/$1; }
compctl -/ -W /workspaces/github/ gw

function ew { /workspaces/education-web/$1; }
compctl -/ -W /workspaces/education-web/ ew

function cw { /workspaces/classroom/$1 }
compctl -/ -W /workspaces/classroom/ cw

function lsport {
  if [ -z $1 ]
  then
    lsof -nP -iTCP | grep LISTEN
  else
    lsof -nP -iTCP:"$1" | grep LISTEN
  fi
}

alias top="top -o cpu"
alias topmem="top -o mem"
