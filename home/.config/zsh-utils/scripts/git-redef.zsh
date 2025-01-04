# Git Push default to SSH (check .gitconfig)
function git() {
    if [[ "$1" == "push" ]]; then
        shift
        command git push-ssh "$@"
    else
        command git "$@"
    fi
}
