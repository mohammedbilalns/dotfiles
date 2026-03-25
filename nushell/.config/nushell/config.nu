source ~/.local/share/atuin/init.nu
source ~/.zoxide.nu

alias c = clear

# PACKAGE MANAGEMENT (paru / pacman)

alias i = paru -S
alias install = paru -S

alias r = paru -R
alias remove = paru -R

alias s = paru -Ss
alias search = paru -Ss

alias u = paru -Syu
alias update = paru -Syu

alias rm_cache = sudo pacman -Scc

# GIT SHORTCUTS

alias gs = git status
alias ga = git add
alias gc = git commit
alias gp = git push
alias gb = git branch
alias gl = git log

# UTILITIES 

alias c = clear
alias suod = sudo
alias hx = helix
alias cat = bat
alias asr = atuin scripts run
alias run = ~/upstride-backend/init-workspace.sh
alias hl = rg --passthru
