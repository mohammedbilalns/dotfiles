alias ls='lsd -a --group-directories-first'
alias ll="lsd -la --group-directories-first"
# Git 
alias gs="git status"
alias ga="git add"
alias gp="git push"
alias gb="git branch"
alias gl="git log"
alias gc="git commit"

# Utils 
alias c="clear"
alias hx="helix"
alias cat="bat"
alias dwyt='echo -n "Enter video URL: "; read url; yt-dlp -F "$url"; echo -n "Enter format ID to download: "; read fid; yt-dlp -f "$fid" "$url"'
alias asr="atuin scripts run"
alias rm_modules='find . -type d -name node_modules -prune -exec rm -rf {} +'
alias list_content="find . -type f -exec echo '==== {} ====' \; -exec cat {} \;"
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


# pnpm
export PNPM_HOME="/data/data/com.termux/files/home/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
