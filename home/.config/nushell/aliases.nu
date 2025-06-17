alias grun = go run
alias cat = bat --style plain,header-filesize,header-filename --paging=never
alias rsactftool = docker run -it --rm -v $"($env.PWD):/data" rsactftool/rsactftool
alias ubuntinho = docker run --rm -it -v $"($env.PWD):/home/shared" amd64/ubuntu:18.04 /bin/bash -c "cd /home/shared && HOME=/home/shared /bin/bash"
# alias code = code-insiders

alias python3 = uv run python3
alias python = uv run python

alias revshell = uv run penelope
alias fg = job unfreeze

if $env.OS == "Darwin" {
	alias lsusb = cyme --lsusb
	alias unmount = diskutil unmount
	alias umount = diskutil unmount
	alias tailscale = /Applications/Tailscale.app/Contents/MacOS/Tailscale

	def --wrapped mount [disk: string, mount_point: path, ...args] {
		diskutil mount -mountPoint $mount_point $disk ...$args
	}
}

alias multiplex = zellij options --default-shell nu

def --wrapped ssh [...args] {
	with-env { TERM: "xterm-256color" } { ^ssh ...$args }
}

def psub [] {
  # Call out to the external mktemp to get a unique temp‐file path
  let tmp = (mktemp -t | str trim)

  # Write whatever’s coming in ($in) into that file
  $in | save --raw -f $tmp

  # Emit the path so downstream commands can read it
  return $tmp
}

def --wrapped javar [...args] {
	if ($args | length) == 0 {
		print "Usage: javar <filename.java>"
        return 1
	}

	let filename = $args.0
	let base_name = ($filename | str replace ".java" "")

	if not ("./dist" | path exists) {
		mkdir "./dist"
	}

	javac -d ./dist -h ./dist -s ./dist $"($base_name).java"
	let other_args = $args | skip 1

	java -cp ./dist $"($base_name)" ...$other_args
}

def --wrapped crun [...args] {
	if ($args | length) == 0 {
		print "Usage: crun <filename.c>"
        return 1
	}

	let file = $args.0
	let base_name = ($file | str replace ".c" "")
	let other_args = $args | skip 1

	if not ("./dist" | path exists) {
		mkdir "./dist"
	}

	gcc -o ./dist/($base_name) $"($base_name).c" -lm
	# if exit code is not 0, then return
	if ($env.LAST_EXIT_CODE | default 0) != 0 {
		print "Compilation failed"
		return $env.LAST_EXIT_CODE
	}

	chmod +x ./dist/($base_name)

	./dist/($base_name) ...$other_args
}

def --env "sudo su" [] {
	with-env { XDG_CONFIG_HOME: $env.XDG_CONFIG_HOME } { ^sudo --preserve-env nu }
}

def --wrapped --env "sudo" [...args] {
	^sudo --preserve-env TERMINFO=/Applications/Ghostty.app/Contents/Resources/terminfo ...$args
}

def --env activate [] {
	use ($nu.default-config-dir | path join hooks.nu)

	if "VIRTUAL_ENV" in $env {
		return "Already inside a virtual environment, deactivate first"
	}

    let venvs = ls -a
		| where type == dir and name =~ "(?i)env"
		| get name
		| where (
			$env.pwd
				| path join $it bin activate.nu
				| path exists
		)

    if ( $venvs | is-empty ) {
		return "There are no python virtual environments in this folder"
    }

	if ( ($venvs | length) == 1 ) {
		let venv_name = ($venvs | first)
		let venv_activation_file = ($env.pwd | path join $venv_name bin activate.nu)

		hooks run-hooked $"overlay use ($venv_activation_file)"
	} else {
		print "The following venvs are available, please choose one to activate:"

		let choice = $venvs | input list
		let venv_activation_file = ($env.pwd | path join $choice bin activate.nu)

		hooks run-hooked $"overlay use ($venv_activation_file)"
	}
}
