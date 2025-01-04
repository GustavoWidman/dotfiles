# r3dlust's universal ZSHRC

export ZSH="$HOME/.oh-my-zsh"

OS="$(uname)"
ZSH_THEME="r3dlust"

# $HOME that works for root and non-root, referring to the same place (get the $HOME of the first non-root user) uses awk from the "users" command
TRUE_HOME=$(if [[ "$OS" == "Darwin" ]]; then
	dscl . -read "/Users/$(logname)" NFSHomeDirectory | cut -d' ' -f2
else
	grep -m1 '/home/' /etc/passwd | cut -d: -f6
fi)

source $TRUE_HOME/.config/zsh-utils/user-color.zsh # set term prompt color there

zstyle ':omz:update' mode auto      # update automatically without asking

plugins=(git virtualenv zsh-autosuggestions themes)



source $ZSH/oh-my-zsh.sh

# User configuration

# Aliases
alias grun="go run"
alias cat="bat --style plain,header-filesize,header-filename --paging=never"

alias vim="neovide --fork"
alias nvim="neovide --fork"

alias pchain="proxychains -q"
alias pssh="proxychains -q ssh"

source $TRUE_HOME/.config/zsh-utils/scripts/javar.zsh # Java Run (quick build and then run a Java file)
source $TRUE_HOME/.config/zsh-utils/scripts/crun.zsh # C-Run (quick build and then run a C file)


# Bun Completions
[ -s "$TRUE_HOME/.bun/_bun" ] && source "$TRUE_HOME/.bun/_bun"

# Bun
export BUN_INSTALL="$TRUE_HOME/.bun"
export PATH="$BUN_INSTALL/bin:$TRUE_HOME/.local/bin:$PATH"

# Rust
. "$TRUE_HOME/.cargo/env"

# MacOS Specific Stuff
if [[ "$OS" == "Darwin" ]]; then
	# MacOS Rust ESP32 toolkit
	. $TRUE_HOME/export-esp.sh
	export PATH="/Applications/UTM.app/Contents/MacOS:$PATH" # UTM on PATH
fi

# FZF
# eval "$(fzf --zsh)"

# Go
#export GOROOT=/usr/lib/go
#export GOPATH=$TRUE_HOME/go
#export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# MISE
eval "$($TRUE_HOME/.local/bin/mise activate zsh)"

# ls patches (MacOS/Linux compat and ls -a auto fallback as well as coloring)
source $TRUE_HOME/.config/zsh-utils/scripts/ls-redef.zsh

# Git Push default to SSH (check .gitconfig)
source $TRUE_HOME/.config/zsh-utils/scripts/git-redef.zsh
source $TRUE_HOME/.config/zsh-utils/scripts/git-auto-hostname.zsh
