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

# Uncomment following line if you want to the command execution time stamp shown 
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="yyyy-mm-dd"
 HISTSIZE=20000
 SAVEHIST=HISTSIZE
 export HISTSIZE
 export SAVEHIST
 #
 # TODO many of the history options could be cleaned up.  I wanted to save duplicates because 
 # I use history to backfill what I was working on at any given time; removing dups hinders that.
 # Do not consider this appropriate, but it appears to be working

 unsetopt HIST_IGNORE_DUPS
 unsetopt HIST_IGNORE_ALL_DUPS
 setopt HIST_IGNORE_SPACE
 unsetopt HIST_SAVE_NO_DUPS

 setopt INC_APPEND_HISTORY
 setopt SHARE_HISTORY
 setopt EXTENDED_HISTORY

 unsetopt hist_ignore_dups
 unsetopt hist_ignore_all_dups
 setopt hist_ignore_space
 unsetopt hist_save_no_dups

 setopt inc_append_history
 setopt share_history
 setopt extended_history
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump catimg composer docker fasd git-flow tmux vi-mode wd taskwarrior zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
 unsetopt HIST_IGNORE_DUPS
 unsetopt HIST_IGNORE_ALL_DUPS
 setopt HIST_IGNORE_SPACE
 unsetopt HIST_SAVE_NO_DUPS

 unsetopt hist_ignore_dups
 unsetopt hist_ignore_all_dups
 setopt hist_ignore_space
 unsetopt hist_save_no_dups

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/tad/code/go/bin:/home/tad/.cabal/bin"
# export MANPATH="/usr/local/man:$MANPATH"

export PATH="/home/tad/.local/bin:$PATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
#export TERM=screen-256color

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#
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
#GOROOT="/usr/local/go"
#PATH=$PATH:$GOROOT/bin
export GOPATH="$HOME/.gocode"
export PATH=$PATH:$GOPATH/bin

export DEFAULT_USER='tad'
export TERM=xterm-256color

alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0" #|grep capacity|cut -d: -f2"
alias ymd="date +%Y-%m-%d"
alias ymdhms="date +%Y-%m-%d_%H-%M-%S"
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias grep='grep --color=always'
alias diff=colordiff


# http://blog.stefanxo.com/2014/02/clean-up-after-docker/
#alias dockercleancontainers='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
#alias dockercleanimages='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'
#
alias dockercleancontainers="docker container prune"
alias dockercleanimages="docker image prune"
alias dockerclean="dockercleancontainers && dockercleanimages && echo 'run with -a to reclaim more space'"

export NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript:/usr/local/lib/node_modules
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
export PATH="$HOME/.config/composer/vendor/bin":$PATH


export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"


export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$PATH:/home/tad/.gem/ruby/2.4.0/bin"
rbenv global 2.4.0


#PATH="/home/tad/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/home/tad/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/tad/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/tad/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/tad/perl5"; export PERL_MM_OPT;




set -o vi
export FZF_DEFAULT_COMMAND='ag -g ""'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



[[ -f /home/tad/.environmental_variables ]] && . /home/tad/.environmental_variables



 unsetopt hist_expire_dups_first

 unsetopt hist_ignore_dups
 unsetopt hist_ignore_all_dups
 setopt hist_ignore_space
 unsetopt hist_save_no_dups
 unsetopt HIST_IGNORE_DUPS
 unsetopt HIST_IGNORE_ALL_DUPS
 setopt HIST_IGNORE_SPACE
 unsetopt HIST_SAVE_NO_DUPS
# Pyenv config 
export PATH="$HOME/.pyenv/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export GOPATH=$HOME/code/go

aws_completer_path=$HOME/.pyenv/versions/`pyenv version-name`/bin/aws_zsh_completer.sh
if [[ -f $aws_completer_path ]]; then
  autoload bashcompinit
  bashcompinit
  source $aws_completer_path
fi
