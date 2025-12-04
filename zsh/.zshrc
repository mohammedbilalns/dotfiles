setopt CORRECT
PROMPT_EOL_MARK=''

HISTSIZE=1000
SAVEHIST=1000

# Load utilities
eval "$(atuin init zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


########################################
# PATHS & ENVIRONMENT VARIABLES
########################################

path+=$HOME/.cargo/bin
export PATH="$HOME/.local/bin:$PATH"

export STARSHIP_CONFIG=~/.config/starship/starship.toml
export EDITOR=nvim
export VISUAL=nvim


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

alias pg="source venv/bin/activate && pgadmin4 & zen-browser localhost:5050"
alias ls='lsd -a --group-directories-first'
alias ll='lsd -la --group-directories-first'

