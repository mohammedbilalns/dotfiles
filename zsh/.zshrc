
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
alias c="clear"
alias hx="helix"
# alias z="zellij"
alias cat="bat"
alias ping="prettyping"
alias pg="source pgadmin4/bin/activate && pgadmin4 & zen-browser localhost:5050"
eval "$(atuin init zsh)"
eval "$(starship init zsh)"
alias rm_modules='find . -type d -name node_modules -prune -exec rm -rf {} +'

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export STARSHIP_CONFIG=~/.config/starship/starship.toml

PROMPT_EOL_MARK=''

source <(fzf --zsh)
HISTSIZE=1000
SAVEHIST=1000
path+=$HOME/.cargo/bin

export EDITOR=nvim
export VISUAL=nvim
eval "$(zoxide init zsh)"



export PATH="$PATH:$(go env GOPATH)/bin"
