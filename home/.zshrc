# r3dlust's universal ZSHRC

# Profiling (leave off normally)
# zmodload zsh/zprof

export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"

OS="$(uname)"
ZSH_THEME="r3dlust"

# $HOME that works for root and non-root, referring to the same place (get the $HOME of the first non-root user) uses awk from the "users" command
TRUE_HOME=$(if [[ "$OS" == "Darwin" ]]; then
	# may god have mercy on my soul what the fuck is this :sob:
	dscl . -list /Users UniqueID | awk '$2 >= 501 { print $1 }' | head -n 1 | xargs -I {} dscl . -read /Users/{} NFSHomeDirectory | awk '{ print $2 }'
else
	grep -m1 '/home/' /etc/passwd | cut -d: -f6
fi)

source $TRUE_HOME/.config/zsh-utils/user-color.zsh # set term prompt color there

zstyle ':omz:update' auto      # update automatically without asking

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

# Zoxide (Lazy Load)
cd () {
	unset cd

	eval "$(zoxide init zsh --cmd cd)"

	cd "$@"
}

# Python UV+Mise venv
python3() {
	# if VIRTUAL_ENV is set, then use it
	if [[ -n "$VIRTUAL_ENV" ]]; then
		command uv run python3 "$@"
	else
		command python3 "$@"
	fi
}
python() {
	# if VIRTUAL_ENV is set, then use it
	if [[ -n "$VIRTUAL_ENV" ]]; then
		command uv run python "$@"
	else
		command python "$@"
	fi
}

# Lazy load Javar
javar() {
	source $TRUE_HOME/.config/zsh-utils/scripts/javar.zsh # Java Run (quick build and then run a Java file)

	javar "$@"
}

# Lazy load Crun
crun() {
	source $TRUE_HOME/.config/zsh-utils/scripts/crun.zsh # C-Run (quick build and then run a C file)

	crun "$@"
}

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
	# MacOS e2fsprogs
	export PATH="/opt/homebrew/opt/e2fsprogs/bin:$PATH"
  	export PATH="/opt/homebrew/opt/e2fsprogs/sbin:$PATH"
	alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale" # tailscale fix
	export HOMEBREW_NO_ENV_HINTS=TRUE
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

if [[ "$OS" == "Linux" ]]; then
	unalias ls
fi

# Git Push default to SSH (check .gitconfig)
source $TRUE_HOME/.config/zsh-utils/scripts/git-auto-hostname.zsh
source $TRUE_HOME/.config/zsh-utils/scripts/git-redef.zsh

# Profiling (leave off normally)
# zprof

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/r3dlust/.lmstudio/bin"

# bun completions
[ -s "/Users/r3dlust/.bun/_bun" ] && source "/Users/r3dlust/.bun/_bun"

# pnpm
export PNPM_HOME="/Users/r3dlust/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
