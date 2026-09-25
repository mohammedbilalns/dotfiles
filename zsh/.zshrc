setopt CORRECT
PROMPT_EOL_MARK=''
HISTSIZE=1000
SAVEHIST=1000


# Plugins
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#source ~/.zsh/zsh-autosuggestions/
# Utils 
source ~/.config/zsh/utils.zsh
source ~/.config/zsh/pnpm.zsh
#source ~/.config/zsh/android.zsh
# Aliases 
source ~/.config/zsh/aliases/pkg-mgr.zsh
source ~/.config/zsh/aliases/git.zsh
source ~/.config/zsh/aliases/utils.zsh
# PATHS & ENVIRONMENT VARIABLES

path+=$HOME/.cargo/bin
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export EDITOR=nvim
export VISUAL=nvim

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line


export PATH="$HOME/lean-4.27.0-linux/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

export PATH="/home/bilalnsmuhammed/.local/bin:$PATH"
export PATH="/home/bilalnsmuhammed/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/bilalnsmuhammed/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk/bin/java
export PATH="$JAVA_HOME/bin:$PATH"

if [[ -r "$HOME/.local/share/deja/init.zsh" ]]; then
  source "$HOME/.local/share/deja/init.zsh"
else
  eval "$(deja init zsh)"
fi

# zsh-syntax-highlighting must be sourced at the end of the file
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
