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
USER_COLOR="magenta"

zstyle ':omz:update' mode auto      # update automatically without asking

# ENABLE_CORRECTION="true"

# Fix for nvm slowing down zsh load by about 200ms
# zstyle ':omz:plugins:nvm' lazy yes

plugins=(git virtualenv zsh-autosuggestions themes)

source $ZSH/oh-my-zsh.sh

# User configuration

# Aliases
# alias code-insiders="/usr/local/bin/code-update"
# alias code="/usr/local/bin/code-update"
alias grun="go run"
alias cat="bat --style plain,header-filesize,header-filename,grid"

alias vim="neovide --fork"
alias nvim="neovide --fork"

alias pchain="proxychains -q"
alias pssh="proxychains -q ssh"

javar() {
    if [[ -z $1 ]]; then
        echo "Usage: javar <filename.java>"
        return 1
    fi

    local file=$1

    # Remove .java extension if present
    base_name="${file%.java}"

    # Create the dist directory if it doesn't exist
    if [[ ! -d ./dist ]]; then
        mkdir ./dist
    fi

    # Compile the Java file and output class files to dist directory
    javac -d ./dist -h ./dist -s ./dist "$base_name.java"
    if [[ $? -ne 0 ]]; then
        echo "Compilation failed."
        return 1
    fi

    # Properly pass arguments to the Java program
    args=${@: (($#-2)),-1}

    # Run the Java program from the dist directory
    java -cp ./dist "$base_name" $args
}

crun() {
    if [[ -z $1 ]]; then
        echo "Usage: crun <filename.c>"
        return 1
    fi

    local file=$1

    # Remove .c extension if present
    base_name="${file%.c}"

    # Create the dist directory if it doesn't exist
    if [[ ! -d ./dist ]]; then
        mkdir ./dist
    fi

    # Compile the C file and output object files to dist directory
    gcc -o ./dist/$base_name "$base_name.c" -lm
    if [[ $? -ne 0 ]]; then
        echo "Compilation failed."
        return 1
    fi

    # Run the C program from the dist directory
    chmod +x ./dist/$base_name
    ./dist/$base_name
}

# $HOME that works for root and non-root, referring to the same place (get the $HOME of the first non-root user) uses awk from the "users" command
# TRUE_HOME=$(grep -m1 '/home/' /etc/passwd | cut -d: -f6)

# Bun Completions
# [ -s "$TRUE_HOME/.bun/_bun" ] && source "$TRUE_HOME/.bun/_bun"

# Bun
export BUN_INSTALL="$TRUE_HOME/.bun"
export PATH="$BUN_INSTALL/bin:$TRUE_HOME/.local/bin:$PATH"

# Rust
. "$HOME/.cargo/env"

# FZF
# eval "$(fzf --zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsheval "$($TRUE_HOME/.local/bin/mise activate zsh)

# bun completions
# [ -s "/home/r3dlust/.bun/_bun" ] && source "/home/r3dlust/.bun/_bun"


# Go
#export GOROOT=/usr/lib/go
#export GOPATH=$TRUE_HOME/go
#export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# MISE
eval "$(/Users/r3dlust/.local/bin/mise activate zsh)"

# UTM
export PATH="/Applications/UTM.app/Contents/MacOS:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ls -> ls -a
# alias ls="ls -Ga"
# GNU ls for MacOS
alias ls="gls --color=auto -a"

# Git Push default to SSH (check .gitconfig)
function git() {
    if [[ "$1" == "push" ]]; then
        shift
        command git push-ssh "$@"
    else
        command git "$@"
    fi
}
