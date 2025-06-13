use utils.nu

$env.config.show_banner = false
$env.VIRTUAL_ENV_DISABLE_PROMPT = true
$env.OS = uname | get operating-system
$env.HOSTNAME = utils get_hostname
$env.config.buffer_editor = "nano"
$env.USER_COLOR = "magenta"
$env.EDITOR = "nano"

$env.TRUE_HOME = utils true_home

$env.BUN_INSTALL = $"($env.TRUE_HOME)/.bun"
mut path = [
	$"($env.BUN_INSTALL)/bin",
	$"($env.TRUE_HOME)/.local/bin",
	$"($env.TRUE_HOME)/.cargo/bin"
	$"($env.TRUE_HOME)/go/bin",
	"/usr/local/bin",
	$"($env.TRUE_HOME)/.cabal/bin",
	$"($env.HOME)/.ghcup/bin",
]

if $env.OS == "Darwin" {
	# Cache Homebrew environment variables and only update weekly
	utils brew_env 7 | load-env # Update cache weekly

	$env.PNPM_HOME = $env.TRUE_HOME + "/Library/pnpm"

	$path ++= [
		"/opt/homebrew/opt/util-linux/bin",
		"/opt/homebrew/opt/util-linux/sbin"
		"/Applications/UTM.app/Contents/MacOS",
		"/opt/homebrew/opt/e2fsprogs/bin",
		"/opt/homebrew/opt/e2fsprogs/sbin",
		"/opt/homebrew/opt/llvm/bin",
		"/opt/metasploit-framework/bin",
		"/opt/homebrew/Cellar/john-jumbo/1.9.0_1/share/john",
		$env.PNPM_HOME
	]

	$env.HOMEBREW_NO_ENV_HINTS = true

	$env.LDFLAGS = "-L/opt/homebrew/opt/llvm/lib"
  	$env.CPPFLAGS = "-I/opt/homebrew/opt/llvm/include"

	source lsblk.nu
	source utm.nu
}

$env.PATH = ($env.PATH | split row (char esep) | append $path)

source aliases.nu
source hackingclub.nu