# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ezmac"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often to auto-update? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(git autojump catimg composer docker fasd git-flow tmux vi-mode wd taskwarrior zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
# TODO: sort your history out.
unsetopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_SAVE_NO_DUPS

unsetopt hist_ignore_dups
unsetopt hist_ignore_all_dups
setopt hist_ignore_space
unsetopt hist_save_no_dups
 unsetopt hist_expire_dups_first

 unsetopt hist_ignore_dups
 unsetopt hist_ignore_all_dups
 setopt hist_ignore_space
 unsetopt hist_save_no_dups
 unsetopt HIST_IGNORE_DUPS
 unsetopt HIST_IGNORE_ALL_DUPS
 setopt HIST_IGNORE_SPACE
 unsetopt HIST_SAVE_NO_DUPS

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/sbin:/usr/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# I keep my installed binaries in my homedir in .local/bin
export PATH="/home/tad/.local/bin:$PATH"


export EDITOR='vim'
set -o vi


# Maybe fix the end of line woe
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search up-line-or-beginning-search
zle -N down-line-or-beginning-search down-line-or-beginning-search
bindkey -v

# this causes errors in zsh 5.6.2
# bindkey "${key[Up]}" up-line-or-beginning-search
# bindkey "${key[Down]}" down-line-or-beginning-search
#bindkey "^[[A" up-line-or-beginning-search
#bindkey "^[[B" down-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

# GOLANG
export PATH=$PATH:$GOPATH/bin
export GOPATH=$HOME/code/go

export DEFAULT_USER='tad'
export TERM=xterm-256color

alias ymd="date +%Y-%m-%d"
alias ymdhms="date +%Y-%m-%d_%H-%M-%S"
alias dockercleancontainers="docker container prune"
alias dockercleanimages="docker image prune"
alias dockerclean="dockercleancontainers && dockercleanimages && echo 'run with -a to reclaim more space'"

alias kc=kubectl

if [[ "$(uname)" != "Linux" ]]; then
  alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0" #|grep capacity|cut -d: -f2"
fi

if [[ "$(uname)" != "Darwin" ]]; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
fi
if [[ "$(which colordiff)" != "" ]]; then
  alias diff=colordiff
fi
# Alarm function taken from https://unix.stackexchange.com/questions/1974/how-do-i-make-my-pc-speaker-beep
alarm() {
  timeout --foreground -s 1 ${2:-0.500} speaker-test --frequency ${1:-3000} --test sine
}
# http://blog.stefanxo.com/2014/02/clean-up-after-docker/
#alias dockercleancontainers='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
#alias dockercleanimages='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'
#

#export NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript:/usr/local/lib/node_modules # TODO: Is this for CoC?


# export PATH="$HOME/.nodenv/bin:$PATH"
# eval "$(nodenv init -)"
#fpath=(~/.zsh/completion $fpath) # unused, but neat.


if fzf --version & > /dev/null; then
  export FZF_DEFAULT_COMMAND='ag -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi



# Load env vars if available
[[ -f /home/tad/.environmental_variables ]] && . /home/tad/.environmental_variables



# Pyenv completion
if which -s pyenv >/dev/null; then
  export PYENV_ROOT="$HOME/.pyenv-$(uname -m)"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  export PATH="$HOME/.pyenv-$(uname -m)/shims:${PATH}"
  eval "$(pyenv init - --no-rehash)"
  eval "$(pyenv virtualenv-init - zsh --no-rehash)"

fi


# AWS cli
aws_completer_path=$HOME/.pyenv/versions/`pyenv version-name`/bin/aws_zsh_completer.sh
if [[ -f $aws_completer_path ]]; then
  autoload bashcompinit
  bashcompinit
  source $aws_completer_path
fi

# homebrew BEGIN
if [[ "$(uname)" == "Darwin" ]]; then
  case "$(uname -m)" in
  "x86_64")
     brew_exec=/usr/local/bin/brew
     ;;
  "arm64")
     brew_exec=/opt/homebrew/bin/brew
     ;;
  esac
  if [ -x "$brew_exec" ]; then
     eval "$($brew_exec shellenv)"
  fi
  # homebrew END
fi


tmnt() {
  set -x
  if [[ ! -z $@ ]]; then
    session_identifier=$@
  else
    session_identifier=`basename $PWD|cut -f1 -d.`
  fi
  session=`tmux ls|grep --color=never "$session_identifier"`
  if [[ ! -z $session ]]; then
    tmux attach -t $session_identifier
  else
    tmux new -s $session_identifier
  fi
  set +x
}

# BFG https://rtyley.github.io/bfg-repo-cleaner/
alias bfg="java -jar ~/apps/bfg-1.13.0.jar"

countdown(){
    date1=$((`date +%s` + $1));
    while [ "$date1" -ge `date +%s` ]; do 
    ## Is this more than 24h away?
    days=$(($(($(( $date1 - $(date +%s))) * 1 ))/86400))
    echo -ne "$days day(s) and $(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
    sleep 0.1
    done
}
stopwatch(){
    date1=`date +%s`;
    while true; do 
    days=$(( $(($(date +%s) - date1)) / 86400 ))
    echo -ne "$days day(s) and $(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
    sleep 0.1
    done
}
