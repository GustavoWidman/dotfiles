function nano() {
	local cmd=("nano" "--rcfile" "$TRUE_HOME/.nanorc")

    if [[ $EUID -eq 0 ]]; then
    	if [[ "$OS" == "Darwin" ]]; then
			cmd+=("--rcfile" "/var/root/.nanorc")
    	else
    		cmd+=("--rcfile" "/root/.nanorc")
    	fi
    fi

    command "${cmd[@]}" "$@"
}
