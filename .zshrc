# Antigen
# -------

# source "$HOME/.antigen.zsh"
# antigen bundle zsh-users/zsh-completions
# antigen apply

# Prompt
# ------

# Reference: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
source ~/.git-prompt.sh
setopt prompt_subst
PROMPT='%F{green}%~%f%F{cyan}$(__git_ps1 " (%s)")%f '
RPROMPT='%F{black}%B%*%b%f'

# Completion
# ----------

# Case insensitive and fuzzy tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

# History
# -------

HISTDUP=erase
# setopt sharehistory
# setopt incappendhistory

# history file
HISTFILE=~/.zsh-history

# history length
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
setopt appendhistory

# don't add duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# NVM
# ---

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Keybidings
# ----------

bindkey -e

# Home key
bindkey '^[[7~' beginning-of-line                               
bindkey '^[[H' beginning-of-line

# End key
bindkey '^[[8~' end-of-line
bindkey '^[[F' end-of-line

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     
bindkey '^[Od' backward-word                                    
bindkey '^[[1;5D' backward-word                                 
bindkey '^[[1;5C' forward-word     

# delete previous word with ctrl+backspace                     
bindkey '^H' backward-kill-word       

# Shift+tab undo last action
bindkey '^[[Z' undo                                

# Aliases
# -------

alias ls='ls --color=auto -F'
alias la="ls -A"
alias ll="ls -l"
alias lla="ls -lA"
alias ..="cd .."
alias cp="cp -i"
alias mv="mv -i"
alias mk="mkdir -p"
alias path="echo -e $PATH | tr ':' '\n'"
alias grep="grep -n --color=auto"

export winhome=$(wslpath "$(wslvar USERPROFILE)")

# Functions
# ---------

# Creates a new directory and enters it
function mkcd() {
    mkdir $1; cd $1;
}

# Opens a given directory or current one if no args are passed
function op() {
    if [ $# -eq 0 ]; then
        explorer.exe .;
    else
        explorer.exe $1;
fi;
}

# Extras
# ------

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R

# Local config
# ------------

if [ -f ~/.local-zshrc ]; then
    source ~/.local-zshrc
fi

# References
#   Prompt: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
