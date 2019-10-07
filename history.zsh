# Uncomment following line if you want to the command execution time stamp shown 
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="yyyy-mm-dd"
 HISTSIZE=200000
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
