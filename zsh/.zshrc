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

# PATHS & ENVIRONMENT VARIABLES

path+=$HOME/.cargo/bin
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"

export STARSHIP_CONFIG=~/.config/starship/starship.toml
export EDITOR=nvim
export VISUAL=nvim

# PACKAGE MANAGEMENT (paru / pacman)
PKG_MGR="paru"
alias i="${PKG_MGR} -S"
alias install="${PKG_MGR} -S"

alias r="${PKG_MGR} -R"
alias remove="${PKG_MGR} -R"

alias s="${PKG_MGR} -Ss"
alias search="${PKG_MGR} -Ss"

alias u="${PKG_MGR} -Syu"
alias update="${PKG_MGR} -Syu"

alias rm_cache="sudo pacman -Scc"

# GIT SHORTCUTS

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gb="git branch"
alias gl="git log"

# UTILITIES 

alias c="clear"
alias suod="sudo"
alias hx="helix"
alias cat="bat"
alias asr="atuin scripts run"
alias run="~/upstride-backend/init-workspace.sh"
alias hl="rg --passthru"

alias pg="source venv/bin/activate && pgadmin4 & zen-browser localhost:5050"
alias ls='lsd -a --group-directories-first'
alias ll='lsd -la --group-directories-first'

# pnpm
export PNPM_HOME="/home/bilalnsmuhammed/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

