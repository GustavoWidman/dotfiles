# (autoload -Uz compinit; compinit &)

# zmodload zsh/zprof
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="r3dlust"

zstyle ':omz:update' mode auto      # update automatically without asking

# ENABLE_CORRECTION="true"

# Fix for nvm slowing down zsh load by about 200ms
# zstyle ':omz:plugins:nvm' lazy yes

plugins=(git virtualenv zsh-autosuggestions themes)

source $ZSH/oh-my-zsh.sh

# User configuration

# Aliases
alias code="code-insiders"
alias zed="zeditor"
alias grun="go run"
alias cat="bat --style plain,header-filesize,header-filename,grid"

alias opacity-on="sed -i 's/#opacity=/opacity=/g' ~/.var/app/org.gnome.Ptyxis.Devel/config/glib-2.0/settings/keyfile"
alias opacity-off="sed -i 's/opacity=/#opacity=/g' ~/.var/app/org.gnome.Ptyxis.Devel/config/glib-2.0/settings/keyfile"

alias vim="neovide --fork"
alias nvim="neovide --fork"

# $HOME that works for root and non-root, referring to the same place (get the $HOME of the first non-root user) uses awk from the "users" command
TRUE_HOME=$(grep -m1 '/home/' /etc/passwd | cut -d: -f6)

# Bun Completions
[ -s "$TRUE_HOME/.bun/_bun" ] && source "$TRUE_HOME/.bun/_bun"

# Bun
export BUN_INSTALL="$TRUE_HOME/.bun"
export PATH="$BUN_INSTALL/bin:$TRUE_HOME/.local/bin:$PATH"

# Rust
. "$HOME/.cargo/env"

# FZF
# eval "$(fzf --zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsheval "$($TRUE_HOME/.local/bin/mise activate zsh)"

eval "$($TRUE_HOME/.local/bin/mise activate zsh)"
