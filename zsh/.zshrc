
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
alias z="zellij"
eval "$(atuin init zsh)"
eval "$(starship init zsh)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export STARSHIP_CONFIG=~/.config/starship/starship.toml


PROMPT_EOL_MARK=''

source <(fzf --zsh)
HISTSIZE=1000
SAVEHIST=1000
path+=$HOME/.cargo/bin

{ eval $(ssh-agent) && ssh-add -k ~/.ssh/githubauth; } &>/dev/null
#eval "$(zellij setup --generate-auto-start zsh)"
