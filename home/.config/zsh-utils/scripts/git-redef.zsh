# Git Push default to SSH (check .gitconfig)
function git() {
    if [[ "$1" == "push" ]]; then
        shift
        command git push-ssh "$@"
    elif [[ "$1" == "clone" ]]; then
    	shift
    	command git clone --recurse-submodules "$@"
    else
        command git "$@"
    fi
}
