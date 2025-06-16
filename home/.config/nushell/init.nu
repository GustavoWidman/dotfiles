

def --env init_rust_toolchain () {
	if not ($"($env.TRUE_HOME)/.cargo" | path exists) {
		let tmp = (mktemp -t --suffix ".sh" | str trim)
		/bin/bash -c $"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > ($tmp)
chmod +x ($tmp)
($tmp) -y
rm ($tmp)"
	}
}

def --env init_uv () {
	if not (($"($env.TRUE_HOME)/.local/bin/uv" | path exists) or ((which uv | length) > 0)) {
		curl -LsSf https://astral.sh/uv/install.sh | sh
	}
}

def --env init_mise () {
	if not (($"($env.TRUE_HOME)/.local/bin/mise" | path exists) or ((which mise | length) > 0)) {
		curl https://mise.run/ | sh
	}
}

# REQUIRES RUST TOOLCHAIN
def --env init_zoxide () {
	if not (($"($env.TRUE_HOME)/.cargo/bin/zoxide" | path exists) or ((which zoxide | length) > 0)) {
		cargo install zoxide --locked
	}
}

# REQUIRES RUST TOOLCHAIN
def --env init_bat () {
	if not (($"($env.TRUE_HOME)/.cargo/bin/bat" | path exists) or ((which bat | length) > 0)) {
		cargo install bat --locked
	}
}

# REQUIRES RUST TOOLCHAIN
def --env init_plugins () {
	let plugins = plugin list;

	# gstat plugin
	if (plugin list | where name == gstat | length) == 0 {
		cargo install nu_plugin_gstat --locked
		plugin add $"($env.TRUE_HOME)/.cargo/bin/nu_plugin_gstat"
	}

	# port extension plugin
	if (plugin list | where name == port_extension | length) == 0 {
		cargo install --git https://github.com/FMotalleb/nu_plugin_port_extension.git --locked
		plugin add $"($env.TRUE_HOME)/.cargo/bin/nu_plugin_port_extension"
	}
}

export def --env init_user_color () {
	if not (($"($env.TRUE_HOME)/.user_color" | path exists)) {
		# prompt user for a valid color
		mut color = ""
		while $color == "" {
			let user_input = input $"(ansi light_gray)[(ansi reset)(ansi green_bold)+(ansi reset)(ansi light_gray)](ansi reset) Enter the user color you would like to use for this machine \(e.g. (ansi red)red(ansi reset), (ansi blue)blue(ansi reset), (ansi green)green(ansi reset)\): " | str trim
			# try to parse as a ascii color
			try {
				ansi $user_input

				$color = $user_input
			} catch {
				print $"(ansi light_gray)[(ansi reset)(ansi red_bold)!(ansi reset)(ansi light_gray)](ansi reset)(ansi red) Please enter a valid color name.(ansi reset)\n"
			}
		}

		# save $env.USER_COLOR: $color record to a file
		$color | save -f $"($env.TRUE_HOME)/.user_color"
	}

	# load the user color from the file
	return (open $"($env.TRUE_HOME)/.user_color" | str trim)
}

export def --env full_init () {
	init_rust_toolchain
	init_uv
	init_mise
	init_zoxide
	init_bat
	init_plugins
}