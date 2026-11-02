setopt CORRECT
PROMPT_EOL_MARK=''
HISTSIZE=1000
SAVEHIST=1000

eval "$(atuin init zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# Utils 
source ~/.config/zsh/pnpm.zsh
source ~/.config/zsh/android.zsh
# Aliases 
source ~/.config/zsh/aliases/pkg-mgr.zsh
source ~/.config/zsh/aliases/git.zsh
source ~/.config/zsh/aliases/utils.zsh
# PATHS & ENVIRONMENT VARIABLES

path+=$HOME/.cargo/bin
export PATH="$HOME/.local/usr/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export EDITOR=nvim
export VISUAL=nvim

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

export PATH="$HOME/.npm-global/bin:$PATH"

export PATH="/home/bilalnsmuhammed/.local/bin:$PATH"
export PATH="/home/bilalnsmuhammed/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/bilalnsmuhammed/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
# export JAVA_HOME=/usr/lib/jvm/java-21-openjdk/bin/java
# export PATH="$JAVA_HOME/bin:$PATH"

# Extensions
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# jj autocompletion 
#fpath=(~/.zsh/completions $fpath) 
# autoload -U compinit
# compinit
# source <(jj util completion zsh)
