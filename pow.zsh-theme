# vim:ft=zsh ts=2 sw=2 sts=2

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

CBG="NONE"

# Special Powerline characters

SEP=""
SEPR=""
SSEP=""
SSEPR=""

# Colors

darkCol=236
lightCol=238

gray0=233
gray1=235
gray2=236
gray3=239
gray4=240
gray5=241
gray6=244
gray7=245
gray8=247
gray9=250
gray10=252

warnCol=202
errCol=124
cyanCol=123

gitGreenCol=010
gitYellCol=011

darkgreen=033
#mediumgreen=118
mediumgreen=015
brightgreen=115

() {
  local LC_ALL="" LC_CTYPE="en_US.UTF-8"
  SEGMENT_SEPARATOR=$'\ue0b0'
}

spacer="$FG[$darkCol]$BG[$lightCol]$SEP$FG[$lightCol]$BG[$darkCol]$SEP"

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  if [[ $CBG != 'NONE' ]]; then
		if [[ $1 != $CBG ]]; then
		  #echo -n " $bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
		  echo -n " $BG[$1]$FG[$CBG]$SEP$FG[$2] "
		else
		  echo -n " $SSEP$BG[$1]$FG[$1]-$FG[$2] "
		fi
	else
		echo -n "$BG[$1]$FG[$1]-$FG[$2]"
	fi
  CBG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CBG ]]; then
    #echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
    echo -n " $reset_color$FG[$CBG]$SEP"
  fi
  echo -n "$reset_color\n"
  [[ $UID -eq 0 ]] && echo "# " || echo "$ "
	CURRENT_BG=''
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment $mediumgreen $gray0 "$USER@%m"
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {

  local PL_BRANCH_CHAR
  () {
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
    PL_BRANCH_CHAR=$'\ue0a0'         # 
  }
  local ref dirty mode repo_path
  repo_path=$(git rev-parse --git-dir 2>/dev/null)

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git rev-parse --short HEAD 2> /dev/null)"
    if [[ -n $dirty ]]; then
      prompt_segment $gitYellCol 000
    else
      prompt_segment $gitGreenCol 000
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
    zstyle ':vcs_info:*' stagedstr '+' #'✚'
    zstyle ':vcs_info:*' unstagedstr '?' #'●'
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats ' %u%c'
    vcs_info
    echo -n "${ref/refs\/heads\//$PL_BRANCH_CHAR }${vcs_info_msg_0_%% }${mode}"
  fi
}

prompt_hg() {
  local rev status
  if $(hg id >/dev/null 2>&1); then
    if $(hg prompt >/dev/null 2>&1); then
      if [[ $(hg prompt "{status|unknown}") = "?" ]]; then
        # if files are not added
        prompt_segment $errCol 255
        st='±'
      elif [[ -n $(hg prompt "{status|modified}") ]]; then
        # if any modification
        prompt_segment $gitYellCol 000
        st='±'
      else
        # if working copy is clean
        prompt_segment $gitGreenCol 000
      fi
      echo -n $(hg prompt "☿ {rev}@{branch}") $st
    else
      st=""
      rev=$(hg id -n 2>/dev/null | sed 's/[^-0-9]//g')
      branch=$(hg id -b 2>/dev/null)
      if `hg st | grep -q "^\?"`; then
        prompt_segment $errCol 000
        st='±'
      elif `hg st | grep -q "^[MA]"`; then
        prompt_segment $gitYellCol 000
        st='±'
      else
        prompt_segment $gitGreenCol 000
      fi
      echo -n "☿ $rev@$branch" $st
    fi
  fi
}

# Dir: current working directory
prompt_dir() {
  # prompt_segment $darkCol 255 "$(pwd | sed s+/+§+ | sed s!§home/kai!~! | sed s+/+$FG[$darkCol]-$FG[$lightCol]$SSEP$FG[$darkCol]-$FG[255]+g | sed s+§+/+)"
	# prompt_segment $darkCol 255 "$(pwd | sed s+/+§+ | sed s!§home/kai!~! | sed s+/+\ $spacer\ $FG[255]+g | sed s+§+/+)"
	prompt_segment $gray2 $mediumgreen "$(pwd | sed s!/home/kai!~!)"
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
  #[[ $RETVAL -ne 0 ]] && symbols+="$FG[$warnCol][$RETVAL]$FG[000]"
  [[ $UID -eq 0 ]] && symbols+="$FG[$mediumgreen]⚡$FG[000]"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="$FG[$cyanCol]⚙$FG[000]"

  [[ -n "$symbols" ]] && prompt_segment $gray2 000 "$symbols"
}

# Error Code
prompt_errno() {
 [[ $RETVAL -ne 0 ]] && prompt_segment $warnCol 000 "[$RETVAL]" 
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  #prompt_virtualenv
  #prompt_context
  prompt_dir
  prompt_git
  prompt_hg
  prompt_errno
  prompt_end
}

#PROMPT='$(echo -e "\n$reset_color%{%f%b%k%}$(build_prompt)\n $ ")'
PROMPT='$(echo -e "\n$reset_color$(build_prompt)")'
#RPROMPT='$(date +"%H:%M")'
