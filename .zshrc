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
 HISTSIZE=10000
 SAVEHIST=HISTSIZE
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump catimg composer common-aliases debian docker fasd git-flow lol tmux vi-mode wd taskwarrior zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/home/tad/bin:/home/tad/.rvm/gems/ruby-1.9.3-p448/bin:/home/tad/.rvm/gems/ruby-1.9.3-p448@global/bin:/home/tad/.rvm/rubies/ruby-1.9.3-p448/bin:/home/tad/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/tad/code/go/bin:/home/tad/.cabal/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# # Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

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
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
GOROOT="/usr/local/go"
PATH=$PATH:$GOROOT/bin
GOPATH="$HOME/go"

export DEFAULT_USER='tad'
export TERM=xterm-256color
export DOCKER_BASEDIR=$HOME/apps/docker
export SPINUP_BASEDIR=/var/storage/spinup
export AS=$DOCKER_BASEDIR/ArchivesSpace
export NEWSITE=/var/porterhouse/f/Inetpub/wwwroot/newsite/

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias grep='grep --color=always'

alias diff=colordiff
# http://blog.stefanxo.com/2014/02/clean-up-after-docker/
alias dockercleancontainers="docker ps -a -notrunc| grep 'Exit' | awk '{print \$1}' | xargs -L 1 -r docker rm"
alias dockercleanimages="docker images -a -notrunc | grep none | awk '{print \$3}' | xargs -L 1 -r docker rmi"
alias dockerclean="dockercleancontainers && dockercleanimages"
export NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript:/usr/local/lib/node_modules



