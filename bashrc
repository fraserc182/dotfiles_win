# Path to your oh-my-bash installation.
export OSH=~/.oh-my-bash/

export BASH_SILENCE_DEPRECATION_WARNING=1
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="font"

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  ssh
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bashmarks
)

source $OSH/oh-my-bash.sh
# set source as bash_profile so mac specific path lines can be added here

#################
# custom config #
#################

# add /usr/local/bin to path, required for aws cli
export PATH=/usr/local/bin:$PATH

# set default editor as nvim
export EDITOR="nvim"
export VISUAL="nvim"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

###########
# General #
###########

# Auto "cd" when entering just a path
#shopt -s autocd 2> /dev/null

# Line wrap on window resize
shopt -s checkwinsize 2> /dev/null

# Case-insensitive tab completetion
bind 'set completion-ignore-case on'

# Show tab completion options on the first press of TAB
#bind 'set show-all-if-ambiguous on'
#bind 'set show-all-if-unmodified on'

###########
# History #
###########

# Append to the Bash history file, rather than overwriting
shopt -s histappend 2> /dev/null

# Hide some commands from the history
#export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";

# Entries beginning with space aren't added into history, and duplicate
# entries will be erased (leaving the most recent entry).
export HISTCONTROL="ignorespace:erasedups"

# Give history timestamps.
export HISTTIMEFORMAT="[%F %T] "

# Lots o' history.
export HISTSIZE=10000
export HISTFILESIZE=10000


###########
# Aliases #
###########

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

alias grep='grep --color=auto -n -i'
# clears scrollback history also
alias clear="clear && printf '\e[3J'";

alias df="df -h"
alias du="du -h"
alias vim="nvim"

alias vim="nvim"
#############
# Functions #
#############

# Colored man pages
man() {
env LESS_TERMCAP_mb=$'\E[01;31m' \
LESS_TERMCAP_md=$'\E[01;38;5;74m' \
LESS_TERMCAP_me=$'\E[0m' \
LESS_TERMCAP_se=$'\E[0m' \
LESS_TERMCAP_so=$'\E[38;5;246m' \
LESS_TERMCAP_ue=$'\E[0m' \
LESS_TERMCAP_us=$'\E[04;38;5;146m' \
man "$@"
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/fraser/google-cloud-sdk/path.bash.inc' ]; then . '/home/fraser/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/fraser/google-cloud-sdk/completion.bash.inc' ]; then . '/home/fraser/google-cloud-sdk/completion.bash.inc'; fi
