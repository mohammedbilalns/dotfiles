
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
eval "$(atuin init zsh)"
eval "$(starship init zsh)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export STARSHIP_CONFIG=~/.config/starship/starship.toml


PROMPT_EOL_MARK=''

# pnpm
export PNPM_HOME="/home/mohammedbilalns/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
