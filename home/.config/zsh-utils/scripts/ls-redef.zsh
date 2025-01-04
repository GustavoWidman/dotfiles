# Default ls to color. If there are no results of "ls", use "ls -a"
function ls() {
	# Compat with Linux and MacOS
	local ls_cmd="ls"  # Default to `ls`

	if [[ "$(uname)" == "Darwin" ]]; then
		ls_cmd="gls"  # Use `gls` (GNU-ls) on macOS. Requires 'coreutils' on homebrew.
	fi

	# Count the number of non-hidden files and directories
	if [ "$($ls_cmd | wc -l)" -eq 0 ]; then
    	# If the count is zero, use 'ls -a' to show hidden files
		command $ls_cmd --color=auto -a "$@"
	else
		# Otherwise, use regular 'ls'
		command $ls_cmd --color=auto "$@"
  	fi
}
