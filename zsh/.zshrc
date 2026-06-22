setopt CORRECT
PROMPT_EOL_MARK=''
HISTSIZE=1000
SAVEHIST=1000


# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-autosuggestions/
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Utils 
source ~/.config/zsh/utils.zsh
source ~/.config/zsh/pnpm.zsh
source ~/.config/zsh/android.zsh
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

# export ANDROID_HOME=$HOME/Android
# export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# export PATH=$PATH:$ANDROID_HOME/emulator
#
# export ANDROID_HOME=/opt/android-sdk
# export ANDROID_SDK_ROOT=/opt/android-sdk
# export NDK_HOME=/opt/android-sdk/ndk/29.0.13846066
#
# export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

