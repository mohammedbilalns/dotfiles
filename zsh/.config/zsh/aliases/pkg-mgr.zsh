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
alias rm_orphans="sudo pacman -Rns $(pacman -Qdtq)"
