#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias c="clear"
PS1='[\u@\h \W]\$ '

export PATH="$HOME/.local/bin:$PATH"
eval "$(starship init bash)"
eval "$(atuin init bash)"
eval "$(zoxide init bash)"


########################################
# PACKAGE MANAGEMENT (paru / pacman)
########################################

alias i="paru -S"
alias install="paru -S"

alias r="paru -R"
alias remove="paru -R"

alias s="paru -Ss"
alias search="paru -Ss"

alias u="paru -Syu"
alias update="paru -Syu"

alias rm_cache="sudo pacman -Scc"


########################################
# GIT SHORTCUTS
########################################

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gb="git branch"
alias gl="git log"


########################################
# UTILITIES 
########################################

alias c="clear"
alias hx="helix"
alias cat="bat"
alias asr="atuin scripts run"
alias run="~/upstride-backend/init-workspace.sh"
alias hl="rg --passthru"

alias pg="source venv/bin/activate && pgadmin4 & zen-browser localhost:5050"
alias ls='lsd -a --group-directories-first'
alias ll='lsd -la --group-directories-first'

