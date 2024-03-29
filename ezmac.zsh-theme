# vim:ft=zsh ts=2 sw=2 sts=2
#
# agnoster's Theme - https://gist.github.com/3712874
# A Powerline-inspired theme for ZSH
#
# # README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://github.com/Lokaltog/powerline-fonts).
#
# In addition, I recommend the
# [Solarized theme](https://github.com/altercation/solarized/) and, if you're
# using it on Mac OS X, [iTerm 2](http://www.iterm2.com/) over Terminal.app -
# it has significantly better color fidelity.
#
# # Goals
#
# The aim of this theme is to only show you *relevant* information. Like most
# prompts, it will only show git information when in a git working directory.
# However, it goes a step further: everything from the current user and
# hostname to whether the last call exited with an error to whether background
# jobs are running in this shell will all be displayed automatically when
# appropriate.

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

CURRENT_BG='NONE'
SEGMENT_SEPARATOR=''

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$user@%m"
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {
  local ref dirty mode repo_path
  repo_path=$(git rev-parse --git-dir 2>/dev/null)

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
    if [[ -n $dirty ]]; then
      prompt_segment yellow black
    else
      prompt_segment green black
    fi

    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '✚'
    zstyle ':vcs_info:git:*' unstagedstr '●'
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats ' %u%c'
    vcs_info
    echo -n "${ref/refs\/heads\// }${vcs_info_msg_0_%% }${mode}"
  fi
}
prompt_aws() {
  repo_path=$(git rev-parse --git-dir 2>/dev/null)

  if [[ -z $AWS_PROFILE ]]; then
    return
  fi
  if [[ ! -z $AWS_PROFILE ]]; then

    if [[ $AWS_PROFILE == *"prod"*  ||  $AWS_PROFILE == ${PROD_AWS_PROFILE} ]]; then
      prompt_segment red white
    else
      prompt_segment green black
    fi
    setopt promptsubst
    echo -n "☁️ $AWS_PROFILE"
  fi
}


prompt_hg() {
  local rev status
  if $(hg id >/dev/null 2>&1); then
    if $(hg prompt >/dev/null 2>&1); then
      if [[ $(hg prompt "{status|unknown}") = "?" ]]; then
        # if files are not added
        prompt_segment red white
        st='±'
      elif [[ -n $(hg prompt "{status|modified}") ]]; then
        # if any modification
        prompt_segment yellow black
        st='±'
      else
        # if working copy is clean
        prompt_segment green black
      fi
      echo -n $(hg prompt "☿ {rev}@{branch}") $st
    else
      st=""
      rev=$(hg id -n 2>/dev/null | sed 's/[^-0-9]//g')
      branch=$(hg id -b 2>/dev/null)
      if `hg st | grep -Eq "^\?"`; then
        prompt_segment red black
        st='±'
      elif `hg st | grep -Eq "^(M|A)"`; then
        prompt_segment yellow black
        st='±'
      else
        prompt_segment green black
      fi
      echo -n "☿ $rev@$branch" $st
    fi
  fi
}

# Dir: current working directory
prompt_dir() {
  
  IFS='/' read -rA dir_parts <<<  `pwd|sed -e "s,^$HOME,~,"`
  depth=${#dir_parts[@]}
  if [[ depth -le 2 ]]; then
    prompt_segment blue black "${PWD/#$HOME/~}"
  else
    prompt_segment blue black 
    if [[ `pwd` == *$HOME* ]]; then
      echo -n "~/"
    else
      IFS='/' read -rA dir_parts <<<  `pwd`
      depth=${#dir_parts[@]}
      echo -n "/"
    fi
    COUNTER=1
    while [[ $COUNTER -lt $(($depth-2)) ]]; do
      echo -n "../"
      let COUNTER=$COUNTER+1
    done
    echo -n "${dir_parts[$(($depth-1))]}/${dir_parts[$(($depth))]}"
  fi
  #prompt_segment blue black '%~'
}

# Command number
prompt_cmdnumber() {
    prompt_segment black default "$[HISTCMD]"
}

# Virtualenv: current working virtualenv
prompt_virtualenv() {
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
    prompt_segment blue black "(`basename $virtualenv_path`)"
  fi
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && prompt_segment black default "$symbols"
}
prompt_random_name(){
  prompt_segment black green 
  #pad_str " " 13 $(js ~/.prompt_randomizer.js)

}

pad_str() {
  pad=$(printf '%0.1s' $1{1..60})
  padlength=$2;
  string1=$3;

  printf '%s' "$string1";
  printf '%*.*s' 0 $((padlength - ${#string1} )) "$pad";
}
PROMPT_SHOW_KUBE_CONTEXT=true
enable_prompt_kube_context() {
  PROMPT_SHOW_KUBE_CONTEXT=true
}
disable_prompt_kube_context() {
  PROMPT_SHOW_KUBE_CONTEXT=false
}
toggle_prompt_kube_context() {
  PROMPT_SHOW_KUBE_CONTEXT=!$PROMPT_SHOW_KUBE_CONTEXT
}

prompt_kube_env() {
  if [[ ! -z "$PROMPT_SHOW_KUBE_CONTEXT" && "$PROMPT_SHOW_KUBE_CONTEXT" != false ]]; then
    # Get current context
    local CUR_CONTEXT=$(cat ~/.kube/config | grep --color=never "current-context:" | sed "s/current-context: //")
    declare -A ENV_SHORT_NAMES
    if [ -n "$CUR_CONTEXT" ]; then
      prompt_segment black default  "⎈:${CUR_CONTEXT}"
    fi
    
  fi
}
#
## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_kube_env
  prompt_status
  prompt_virtualenv
  prompt_random_name
  #prompt_cmdnumber
  prompt_context
  prompt_dir
  prompt_git
  prompt_hg
  prompt_aws
  prompt_end
}


PROMPT='%{%-f%b%k%}$(build_prompt) '
