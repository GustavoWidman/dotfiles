use utils.nu

$env.config.show_banner = false
$env.VIRTUAL_ENV_DISABLE_PROMPT = true
$env.OS = uname | get operating-system
$env.HOSTNAME = utils get_hostname
$env.config.buffer_editor = "nano"
$env.USER_COLOR = "magenta"
$env.EDITOR = "nano"

$env.TRUE_HOME = utils true_home

# Cache Homebrew environment variables and only update weekly
utils brew_env 7 | load-env # Update cache weekly

$env.BUN_INSTALL = $"($env.TRUE_HOME)/.bun"
mut path = [
	$"($env.BUN_INSTALL)/bin",
	$"($env.TRUE_HOME)/.local/bin",
	$"($env.TRUE_HOME)/.cargo/bin"
	"/usr/local/bin",
]

if $env.OS == "Darwin" {
	$path ++= [
		"/Applications/UTM.app/Contents/MacOS",
		"/opt/homebrew/opt/e2fsprogs/bin",
		"/opt/homebrew/opt/e2fsprogs/sbin"
	]

	$env.HOMEBREW_NO_ENV_HINTS = true
}

$env.PATH = ($env.PATH | split row (char esep) | append $path)

source aliases.nu
