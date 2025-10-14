# Package Manager 
alias i="paru -S"
alias install="paru -S"
alias r="paru -R"
alias remove="paru -R"
alias s="paru -Ss"
alias search="paru -Ss"
alias ls='lsd -a --group-directories-first'
alias ll="lsd -la --group-directories-first"
alias u="paru -Syu"
alias update="paru -Syu"
alias rm_cache="sudo pacman -Scc"
# Git 
alias gs="git status"
alias ga="git add"
alias gp="git push"
alias gb="git branch"
alias gl"git log"
alias learn_bash""

# Utils 
alias c="clear"
alias hx="helix"
alias cat="bat"
alias asr="atuin scripts run"
alias run="zellij --layout .config/zellij/mentoring.kdl"
alias open="./scripts/open.sh"
alias pg="source venv/bin/activate && pgadmin4 & zen-browser localhost:5050"
alias rm_modules='find . -type d -name node_modules -prune -exec rm -rf {} +'
alias list_content="find . -type f -exec echo '==== {} ====' \; -exec bat --paging=never {} \;"
alias rm_git='find . -mindepth 2 -type d -name ".git" -exec rm -rf {} +'


setopt CORRECT

eval "$(atuin init zsh)"
eval "$(starship init zsh)"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


PROMPT_EOL_MARK=''

source <(fzf --zsh)
HISTSIZE=1000
SAVEHIST=1000
path+=$HOME/.cargo/bin

export STARSHIP_CONFIG=~/.config/starship/starship.toml
export EDITOR=nvim
export VISUAL=nvim
eval "$(zoxide init zsh)"
export PATH="$PATH:$(go env GOPATH)/bin"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
