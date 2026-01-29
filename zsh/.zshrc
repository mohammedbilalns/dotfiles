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
# PACKAGE MANAGEMENT (apt)
########################################

alias i="sudo apt install"
alias install="sudo apt install"

alias r="sudo apt remove"
alias remove="sudo apt remove"

alias s="apt search"
alias search="apt search"

alias u="sudo apt update && sudo apt upgrade"
alias update="sudo apt update && sudo apt upgrade"

alias rm_cache="sudo apt autoremove"


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
alias asr="atuin scripts run"

alias pg="source venv/bin/activate && pgadmin4 & zen-browser localhost:5050"
alias ls='lsd -a --group-directories-first'
alias ll='lsd -la --group-directories-first'


# bun completions
[ -s "/root/.bun/_bun" ] && source "/root/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
